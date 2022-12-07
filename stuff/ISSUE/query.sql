/*
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164749833698855163;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164749186857693189;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164747858644693179;

update nc_params set LIST_VALUE_ID = NULL where attr_id = 9132718859613059064 and object_id = 9164749833698855163;

*/


select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164749833698855163;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164749186857693189;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164747858644693179;

update nc_params set LIST_VALUE_ID = NULL where attr_id = 9152691259713493756 and object_id = 9164749833698855163;
update nc_params set LIST_VALUE_ID = NULL where attr_id = 9152691259713493756 and object_id = 9164749186857693189;
update nc_params set LIST_VALUE_ID = NULL where attr_id = 9152691259713493756 and object_id = 9164747858644693179;

select * from nc_params where attr_id = 9152691259713493756 and object_id = 9164749833698855163;
select * from nc_params where attr_id = 9152691259713493756 and object_id = 9164749186857693189;
select * from nc_params where attr_id = 9152691259713493756 and object_id = 9164747858644693179;



select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164749833698855163;

delete from nc_params where attr_id = 9152691259713493756 and object_id = 9164749833698855163;
delete from nc_params where attr_id = 9152691259713493756 and object_id = 9164749186857693189;
delete from nc_params where attr_id = 9152691259713493756 and object_id = 9164747858644693179;


Modified By	    63	9164749833698855163	0	internal	[NULL]	[NULL]	1	[NULL]	1
Modified When	64	9164749833698855163	0	[NULL]	[NULL]	[NULL]	1	2022-10-17 05:12:57	1
Status	9132718859613059064	9164749833698855163	0	[NULL]	[NULL]	9132718859613059070	1	[NULL]	1
Retain Historical Price	9152691259713493756	9164749833698855163	0	[NULL]	[NULL]	[NULL]	1	[NULL]	0
Cloud PIM Primary Key ID	9159601534313522448	9164749833698855163	0	9164749833698855163	[NULL]	[NULL]	1	[NULL]	0
Revision	9158719859813724518	9164749833698855163	0	null	[NULL]	[NULL]	1	[NULL]	0

Modified By	   63	9164749186857693189	0	internal	[NULL]	[NULL]	1	[NULL]	1
Modified When	64	9164749186857693189	0	[NULL]	[NULL]	[NULL]	1	2022-10-17 05:12:57	1
Status	            9132718859613059064	9164749186857693189	0	[NULL]	[NULL]	9132718859613059070	1	[NULL]	1
Retain Historical Price	9152691259713493756	9164749186857693189	0	[NULL]	[NULL]	[NULL]	1	[NULL]	0
Revision	9158719859813724518	9164749186857693189	0	null	[NULL]	[NULL]	1	[NULL]	0
Cloud PIM Primary Key ID	9159601534313522448	9164749186857693189	0	9164749186857693189	[NULL]	[NULL]	1	[NULL]	0

Modified By	63	9164747858644693179	0	internal	[NULL]	[NULL]	1	[NULL]	1
Modified When	64	9164747858644693179	0	[NULL]	[NULL]	[NULL]	1	2022-10-17 05:12:57	1
Status	9132718859613059064	9164747858644693179	0	[NULL]	[NULL]	9132718859613059070	1	[NULL]	1
Revision	9158719859813724518	9164747858644693179	0	null	[NULL]	[NULL]	1	[NULL]	0
Cloud PIM Primary Key ID	9159601534313522448	9164747858644693179	0	9164747858644693179	[NULL]	[NULL]	1	[NULL]	0
Retain Historical Price	9152691259713493756	9164747858644693179	0	[NULL]	[NULL]	[NULL]	1	[NULL]	0




/* NULL */

select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164749833698855163;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164749186857693189;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9164747858644693179;

/* YES */
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9162124824137604376;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9163929368250659186;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9162124816233604373;

/* NO */
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9161505375504984302;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9162124821861523962;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9161482789519984292;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9161505364504984297;

/* FIX */
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9161505375504984302;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9162124821861523962;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9161482789519984292;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9161505364504984297;
                                     

/* RETAIN HISTORICAL YES*/
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9162124824137604376;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9163929368250659186;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9162124816233604373;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9161505375504984302;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9162124821861523962;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9161482789519984292;
update nc_params set LIST_VALUE_ID = 7777001 where attr_id = 9152691259713493756 and object_id = 9161505364504984297;


/* RETAIN HISTORICAL NO*/
update nc_params set LIST_VALUE_ID = 7777002 where attr_id = 9152691259713493756 and object_id = 9162124824137604376;
update nc_params set LIST_VALUE_ID = 7777002 where attr_id = 9152691259713493756 and object_id = 9163929368250659186;
update nc_params set LIST_VALUE_ID = 7777002 where attr_id = 9152691259713493756 and object_id = 9162124816233604373;
update nc_params set LIST_VALUE_ID = 7777002 where attr_id = 9152691259713493756 and object_id = 9161505375504984302;
update nc_params set LIST_VALUE_ID = 7777002 where attr_id = 9152691259713493756 and object_id = 9162124821861523962;
update nc_params set LIST_VALUE_ID = 7777002 where attr_id = 9152691259713493756 and object_id = 9161482789519984292;
update nc_params set LIST_VALUE_ID = 7777002 where attr_id = 9152691259713493756 and object_id = 9161505364504984297;


/*All Check*/

select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9162124824137604376;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9163929368250659186;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9162124816233604373;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9161505375504984302;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9162124821861523962;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9161482789519984292;
select a.name, p.* from nc_params p, nc_attributes a where a.attr_id = p.attr_id and p.object_id = 9161505364504984297;



/* Validation Query
9162124824137604376
9163929368250659186
9162124816233604373

9161505375504984302
9162124821861523962
9161482789519984292

9161505364504984297
*/




insert into nc_cmt_ct_modifs (modif_id,activity_id,ci_name,ci_table_name,operation,ts,hidden,hier_parent,ci_id)
select
   nc_cmt_id_seq.nextval as modif_id,
   /*aqui pones el object id de tu CR*/
   9165275652913394065
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
        9162124824137604376,
        9163929368250659186,
        9162124816233604373,
        9161505375504984302,
        9162124821861523962,
        9161482789519984292,
        9161505364504984297
    );





DECLARE
    cnt NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO cnt FROM nc_params WHERE 
    attr_id = 9152691259713493756 
    AND 
    list_value_id = 7777001 
    AND 
    object_id IN 
    (
        9162124824137604376,
        9163929368250659186,
        9162124816233604373,
        9161505375504984302,
        9162124821861523962,
        9161482789519984292,
        9161505364504984297
    );
    IF CNT = 7 THEN
        DBMS_OUTPUT.PUT_LINE('All 7 has Retain to Historical Yes');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Only: '|| cnt || ' has Retain to Historical Yes');
    END IF;
END;
/


/* Validates Each One :v*/

DECLARE
    cnt NUMBER := 0;
    TYPE nt_type IS TABLE of NUMBER;
    nt nt_type := nt_type 
    (
        9162124824137604376,
        9163929368250659186,
        9162124816233604373,
        9161505375504984302,
        9162124821861523962,
        9161482789519984292,
        9161505364504984297
    );
BEGIN
    SAVEPOINT before_dormant;
    FOR i IN 1..nt.count LOOP
        SELECT COUNT(*) INTO cnt FROM nc_params WHERE 
        attr_id = 9152691259713493756 
        AND 
        list_value_id = 7777001 
        AND 
        object_id = nt(i);
        IF cnt = 0 THEN
            DBMS_OUTPUT.PUT_LINE('object_id: '|| nt(i) || ' Has NO as Retain Historical Price');
        END IF;
    END LOOP;
END;
/




select 1 from dual where 1 <> 
(
  select count(*)  from nc_references r, nc_attributes a where 
  a.attr_id = r.attr_id 
  and 
  r.object_id = 9164499726382174377 /*obj_id: Monthly Fee*/
  and 
  r.reference = 9142884438313113733 /*obj_id: 1010*/
  and 
  r.attr_id = 9142883780313111933  /*attr_id: Tax Code */
);


select 1 from dual where 7 <> 
(
    SELECT COUNT(*) FROM nc_params WHERE 
    attr_id = 9152691259713493756 
    AND 
    list_value_id = 7777001
    AND 
    object_id IN 
    (
        9162124824137604376,
        9163929368250659186,
        9162124816233604373,
        9161505375504984302,
        9162124821861523962,
        9161482789519984292,
        9161505364504984297
    )
);
















