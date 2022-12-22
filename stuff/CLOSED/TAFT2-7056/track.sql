insert into nc_cmt_ct_modifs (modif_id,activity_id,ci_name,ci_table_name,operation,ts,hidden,hier_parent,ci_id)
select
   nc_cmt_id_seq.nextval as modif_id,
   /*aqui pones el object id de tu CR*/
   9164980121813264012
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
        /* Warn when “Remove” 900 Block & Toll Block because of additional fee */
        9164964965693303513,
        /* TQ Voice plans (9159722947713609854) are new/current */
        9164975892802236272,
        /* Rule Node*/
        9164975892879236275,
        /* 900 Block (9136923654113578850) is deleted/selected */
        9164975892819236273,
        /* Call Guardian - Toll Block (9136923654113578856) is deleted/selected */
        9164975892840236274
    );

