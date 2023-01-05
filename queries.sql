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


/* Create Address by Query*/
/*************************************************************************************************************************************************************************/
DECLARE
test VARCHAR2(2000);
BEGIN
  PKG_TAFT_UTILS.CREATE_ADDRESS_UNIT('9150147090913062072', test);
  DBMS_OUTPUT.PUT_LINE(test);
END;
/*************************************************************************************************************************************************************************/


/* Display Oracle Stored Procedures */
/*************************************************************************************************************************************************************************/
/* http://dba-oracle.com/t_display_oracle_stored_procedures.htm */


/*************************************************************************************************************************************************************************/


/*Remove Object and children*/
/*************************************************************************************************************************************************************************/
DELETE FROM nc_objects WHERE object_id 
IN 
(
    SELECT object_id FROM nc_objects START WITH object_id = 9151790702613390349
    CONNECT BY PRIOR object_id = parent_id 
);
/*************************************************************************************************************************************************************************/

/* Disable Rule */
/*************************************************************************************************************************************************************************/
UPDATE nc_params    /* No */
SET list_value_id = 5032957201013871254  
WHERE     /* Is Active */
attr_id = 7030253282013155504 
AND 
object_id IN
(   /* Rule */
    9164794031861693353
);
/*************************************************************************************************************************************************************************/

/* Get all children of an object*/
/*************************************************************************************************************************************************************************/
SELECT object_id FROM nc_objects START WITH object_id = 9163040068923653800
CONNECT BY PRIOR object_id = parent_id;

/*************************************************************************************************************************************************************************/


/* Add Object to CR*/
/*************************************************************************************************************************************************************************/
INSERT INTO nc_cmt_ct_modifs (modif_id,activity_id,ci_name,ci_table_name,operation,ts,hidden,hier_parent,ci_id)
SELECT
   nc_cmt_id_seq.nextval AS modif_id,
   /*This is object id of the CR*/
   9165412137913225888
   AS activity_id,
   NAME AS ci_name,
   'NC_OBJECTS' AS ci_table_name,
   'CM' AS operation,
   systimestamp AS ts,
   0 AS hidden,
   0 AS hier_parent,
   object_id AS ci_id
FROM
   nc_objects
WHERE
    /*These are the objects to add*/
    object_id IN 
    (
        9164797039801864836
    );
/*************************************************************************************************************************************************************************/

/* List Clients By Offering */
/*************************************************************************************************************************************************************************/
SELECT 
    bpi.object_id,
    o3.object_id,o3.name,
    p2.value,
    r3.reference,
    o4.name,
    status.list_value_id
FROM 
    nc_references r, 
    nc_attributes a, 
    nc_objects bpi, 
    nc_params status, 
    nc_references r2, 
    nc_objects o2, 
    nc_objects o3, 
    nc_params p2, 
    nc_references r3, 
    nc_objects o4
WHERE a.attr_id = r.attr_id AND r.reference 
IN
(
    9152406687013913547 /* TELUS Internet 750/750 */
)
AND r.attr_id            = 9126099920013458621 /* Product Offering */
AND bpi.object_id        = r.object_id
AND bpi.object_type_id   = 9126083628313449001 /* Business Product Instance */
AND status.object_id     = bpi.object_id
AND status.attr_id       = 9132857804713527164 /* Extended Business Product Instance Status */
AND bpi.object_id        = r2.object_id
AND r2.attr_id           = 9128240368813225026 /* Product Instance OPF */
AND r2.reference         = o2.object_id
AND o3.object_id         = o2.parent_id
AND o3.object_id         = p2.object_id
AND p2.attr_id           = 9138719996013282785 /* Enterprise Customer ID/Customer Profile ID */
AND bpi.object_id        = r3.object_id
AND r3.attr_id           = 9126099920013458621 /* Product Offering */
AND r3.reference         = o4.object_id
ORDER BY status.list_value_id DESC;
/*************************************************************************************************************************************************************************/


/* Find Province By Location*/
/*************************************************************************************************************************************************************************/
SELECT 
    o.object_id,
    o.name,
    pp.name,
    a.object_id
FROM 
    nc_objects o,
    nc_references r,
    nc_objects a,
    nc_objects p,
    nc_objects pp
WHERE o.object_type_id = 4063055943013004400 /* Customer Location */
AND r.object_id = o.object_id
AND r.attr_id = 9132251685613889259 /* Address */
AND a.object_id = r.reference
AND p.object_id = a.parent_id
AND pp.object_id = p.parent_id
AND pp.name = 'ALBERTA';
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
        nco.parent_id = 9135949686713342041 /* Quebec */
    ) sub
WHERE
nco.object_id = sub.customer_id
AND
nco.object_type_id = 2091641841013994133; /* Residential Customer Account */
/*************************************************************************************************************************************************************************/
