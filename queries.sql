/*Find a Rule by Message*/
SELECT * FROM nc_params 
WHERE attr_id = 7030253282013155496 
AND lower(value) 
LIKE lower('Please keep at least 2 of the 7 included features or choose another plan.%');
         

/* Set French as Default */ 
INSERT INTO NC_REFERENCES
(ATTR_ID, REFERENCE, OBJECT_ID, SHOW_ORDER, PRIORITY, ATTR_ACCESS_TYPE)
VALUES (9151911834313410863,2000000000000000007,9164177656313205699,1,0,0 )

/* Disable Rule */
UPDATE nc_params    /*No*/
SET list_value_id = 5032957201013871254  
WHERE     /* Is Active */
attr_id = 7030253282013155504 
AND 
object_id IN
(   /* Rule */
    9164794031861693353
);


/*List Clients By Province*/
9165270880213226757


select nco.object_id, nco.name, nca.name from
    nc_objects    nco,
    nc_references ncr,
    nc_attributes nca
    where
    ncr.reference = 9145624729113810755
    and
    ncr.attr_id = nca.attr_id
;


select * from nc_references where object_id = 9145624729113810755;
select * from nc_references where reference = 9145624729113810755;

rdb_customer_accounts, 
rdb_customer_locations, 
nc_references, 
rdb_bpi

/* dv52 
rakuccbp phone
9165270880213226757
*/

select * from nc_references where object_id = 9145746821913781312;
select * from nc_references where reference = 9145746821913781312;

