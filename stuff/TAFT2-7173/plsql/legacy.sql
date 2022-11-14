SELECT * FROM nc_references WHERE attr_id = 9142883780313111933 AND object_id IN (SELECT object_id  FROM nc_objects nco WHERE parent_id IN 
    (
        /* NO TTV */
        9159401889813267197, /*Prod is 9999*/
        9158380291113393795, /*Prod is 9999*/

        /* TTV; yes csv*/
        9158399012813410416, /*Prod is 9999*/
        9158399038213410421, /*Prod is 9999*/
        9158399058813410426, /*Prod is 9999*/

        /*TTV no ref; yes csv*/
        9158664856213959869, /*No Tax Code*/
        9160842234013024684, /*No Tax Code*/

        /* TTV yes csv*/
        9151948057313944472, /*Prod is 9999*/
        9151948057313944476, /*Prod is 9999*/
        9151948057313944500, /*Prod is 9999*/
        9152413576613344814, /*Prod is 9999*/
        9152413576613344830, /*Prod is 9999*/
        9159789451813673610, /*Prod is 9999*/
        
        /* TTV yes csv*/
        9150139523313950374, /*Prod is 9999*/

        /* NO TTV */
        9150139887213950491, /*Prod is 9999*/
        9150145172713952697, /*Prod is 9999*/
        9159701381813227705, /*Prod is 9999*/
        9159703387413229198, /*Prod is 9999*/
        9160406943613922575  /*Prod is 9999*/
    )
);


SELECT * FROM nc_references WHERE attr_id = 9142883780313111933 AND object_id IN (SELECT object_id  FROM nc_objects nco WHERE parent_id IN 
    (
        /* NO TTV */
        9159401889813267197, /*Prod is 9999*/
        9158380291113393795, /*Prod is 9999*/

        /* NO TTV */
        9150139887213950491, /*Prod is 9999*/
        9150145172713952697, /*Prod is 9999*/
        9159701381813227705, /*Prod is 9999*/
        9159703387413229198, /*Prod is 9999*/
        9160406943613922575  /*Prod is 9999*/
    )
);






insert into nc_cmt_ct_modifs (modif_id,activity_id,ci_name,ci_table_name,operation,ts,hidden,hier_parent,ci_id)
select
   nc_cmt_id_seq.nextval as modif_id,
   /*aqui pones el object id de tu CR*/
   9165137990013204155
   as activity_id,
   name as ci_name,
   'NC_OBJECTS' as ci_table_name,
   'CM' as operation,
   systimestamp as ts,
   0 as hidden,
   0 as hier_parent,
   object_id as ci_id
from
   nc_objects
where
    /*aqui pones el listado de object id separados por coma*/
    object_id in 
    (
        9164261900398996117,
        9158380291113393796,
        9165096461776048903,
        9165096461771048909,
        9159701381813227706,
        9159703387413229199,
        9160406943613922576
    );














