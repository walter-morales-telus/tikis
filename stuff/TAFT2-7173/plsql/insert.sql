DECLARE
    exrow BOOLEAN:=true;
BEGIN
    exrow := EXISTS (SELECT * FROM nc_references where attr_id = 9142883780313111933 and reference = 9153786500813327277 and object_id = 9165017978815046657)
    IF exrow 
    THEN
        DBMS_OUTPUT.PUT_LINE('Hey look, ma!');
    END IF;
END;
/




INSERT INTO  nc_references (attr_id,reference,object_id,show_order,priority,attr_access_type)
VALUES 
(
    /*Tax Code attr*/
    9142883780313111933,
    /*9999 ref*/
    9153786500813327277,
    /*Alteration Price Component*/
    (SELECT object_id  FROM nc_objects nco WHERE parent_id = 9150980333813849805),
    1,
    0,
    0
)











/*object_id of the price alteration of the promotion*/
/*reference to tax code 9999*/
insert into 
nc_references (attr_id,reference,object_id) 
values (9142883780313111933,9153786500813327277,)





/*object_id of the price alteration of the promotion*/
/*reference to tax code 9999*/
update 
nc_references 
set attr_id = 9142883780313111933, reference = (9153786500813327277, object_id = ;



/*object_id of the price alteration of the promotion*/
/*reference to tax code 9998*/
delete 
from nc_references 
where 
attr_id = 9142883780313111933 
and 
reference = 9164799782513550301 
and object_id = ;