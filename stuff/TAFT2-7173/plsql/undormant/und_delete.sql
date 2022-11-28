DECLARE
    cnt NUMBER := 0;
    pnt NUMBER := 0;
    TYPE nt_type IS TABLE of NUMBER;
    nt nt_type := nt_type 
    (
        9158664856213959869,
        9159053927913919577,
        9159053961013919582,
        9160675552413634312,
        9160842234013024684,
        9162497107575737063,
        9162497227667737076,
        9162534270468801755,
        9162534810409801756,
        9162534867275801757,
        9162553651973187476,
        9162553717477187477,
        9162553779467360244,
        9162553822005360245,
        9162606582045256036,
        9162737710118155356,
        9162737738972155361,
        9162902493155724596,
        9162918483597310500,
        9163220747438813389,
        9163221376943813398,
        9163221388475813404,
        9163221848298813414,
        9163395227013963280,
        9163395293935517397,
        9163395308582517400
    );
BEGIN
    SAVEPOINT before_undormant;
    FOR i IN 1..nt.count LOOP                                       /*Tax Code attr*/                  
        SELECT COUNT(*) INTO cnt FROM nc_references WHERE attr_id = 9142883780313111933 AND object_id = (SELECT object_id  FROM nc_objects nco WHERE parent_id = nt(i));
        IF cnt = 0 THEN
        BEGIN 
            SELECT COUNT(*) INTO pnt FROM nc_objects nco WHERE parent_id = nt(i);
            IF pnt = 1 THEN
            BEGIN
                INSERT INTO  nc_references (attr_id,reference,object_id,show_order,priority,attr_access_type)
                VALUES
                (
                    /*Tax Code attr*/
                    9142883780313111933,
                    /*9998 ref*/
                    9164799782513550301,
                    /*Alteration Price Component*/
                    (SELECT object_id  FROM nc_objects nco WHERE parent_id = nt(i)),
                    1,
                    0,
                    0
                );
            END;
            ELSE
                DBMS_OUTPUT.PUT_LINE('Skipped: ' || nt(i) || ' NO Parent ID Reference');
                CONTINUE;
            END IF;
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('TaxCode 9998 successfully INSERTED: ' || nt(i));
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK TO before_undormant;
                DBMS_OUTPUT.PUT_LINE('EXCEPTION WITH OBJECT_ID: ' || nt(i));
            END;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Promotion: '|| nt(i) ||'; Alteration Price already has: ' || cnt || ' TaxCode References; NO INSERT was performed');
        END IF;
    END LOOP;
END;
/