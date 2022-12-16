/*Find a Rule by Message*/
/*************************************************************************************************************************************************************************/
SELECT * FROM nc_params 
WHERE attr_id = 7030253282013155496 
AND lower(value) 
LIKE lower('Please keep at least 2 of the 7 included features or choose another plan.%');
/*************************************************************************************************************************************************************************/

/* Set French as Default */ 
/*************************************************************************************************************************************************************************/
INSERT INTO NC_REFERENCES
(ATTR_ID, REFERENCE, OBJECT_ID, SHOW_ORDER, PRIORITY, ATTR_ACCESS_TYPE)
VALUES (9151911834313410863,2000000000000000007,9164177656313205699,1,0,0 )
/*************************************************************************************************************************************************************************/

/* Disable Rule */
/*************************************************************************************************************************************************************************/
UPDATE nc_params    /*No*/
SET list_value_id = 5032957201013871254  
WHERE     /* Is Active */
attr_id = 7030253282013155504 
AND 
object_id IN
(   /* Rule */
    9164794031861693353
);
/*************************************************************************************************************************************************************************/

/* List Clients By Province */
/*************************************************************************************************************************************************************************/
SELECT 
    nco.name,
    nco.object_id
FROM
nc_objects nco,
(
    SELECT 
        nco.parent_id,
        sub.customer_id
    FROM 
        nc_objects nco,
        (
            SELECT 
                nco.parent_id,
                sub.customer_id
            FROM 
                nc_objects nco,
                (
                    SELECT 
                        nco.parent_id,
                        sub.customer_id
                    FROM 
                        nc_objects nco,
                        (
                            SELECT reference,customer_id FROM
                            (
                                SELECT 
                                    a.name,
                                    r.*,
                                    sub.location_id,
                                    sub.customer_id 
                                FROM 
                                    nc_references r,
                                    nc_attributes a,
                                    (
                                        SELECT rdb.object_id AS location_id, rdb.fk_customer_account_id AS customer_id FROM rdb_customer_locations rdb
                                    ) sub 
                                WHERE a.attr_id = r.attr_id 
                                AND a.name = 'Address'
                                AND r.object_id = sub.location_id
                            )
                        ) sub
                    WHERE 
                    object_id = sub.reference
                ) sub
            WHERE 
            object_id = sub.parent_id
        ) sub
    WHERE 
    nco.object_id = sub.parent_id
    AND 
    nco.parent_id = 9145503963713540495 /* Quebec */
) sub
WHERE
nco.object_id = sub.customer_id
AND
nco.object_type_id = 2091641841013994133; /* Residential Customer Account */
/*************************************************************************************************************************************************************************/
