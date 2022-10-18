/* Rule: [6E] Set delivery mode of 6E equipment to software when HSIA is Software */
select object_id from nc_objects start with object_id = 9164680065920653860 connect by prior object_id=parent_id;


insert into nc_cmt_ct_modifs (modif_id,activity_id,ci_name,ci_table_name,operation,ts,hidden,hier_parent,ci_id)
select
   nc_cmt_id_seq.nextval as modif_id,
   /*aqui pones el object id de tu CR*/
   9164686188513414204
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
      9163434102534517613,
      9164157172488382602,
      9164680065920653860,
      9164687568721359193,
      9164687568784359194,
      9164687568742359195,
      9164687568733359196,
      9164687568770359189,
      9164687568702359190,
      9164687568758359191,
      9164687568703359192
    );

