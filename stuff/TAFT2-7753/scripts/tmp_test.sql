/**** YES YES YES OPTIK TV Tax Included Offer YES YES YES ****/
DECLARE
    cnt NUMBER := 0;
    v_code  NUMBER;
    v_errm  VARCHAR2(64);

    TYPE NumberArrayType IS TABLE of NUMBER;
    NumArray NumberArrayType := NumberArrayType 
    (
        9154560597613899784
    );

BEGIN
    SAVEPOINT before_datafix;
    FOR i IN 1..NumArray.count LOOP

        /*** NO Alteration Price Component Validation ***/
        SELECT COUNT(*) INTO cnt  FROM nc_objects nco WHERE parent_id = NumArray(i);
        IF cnt = 0 THEN 
            DBMS_OUTPUT.PUT_LINE('Promotion: '|| NumArray(i) ||' Has NO Price Alteration Component -> SKIPED');
            CONTINUE;
        END IF;


        /* Promo has TIC Promotion Category? */
        SELECT COUNT(*) INTO cnt FROM nc_references WHERE 
        attr_id = 9153770145313318210   /* ATTR_ID : Promotion Type */
        AND
        reference = 9153779179813323603 /* REFERENCE :  Tax Included Credits */ 
        AND
        object_id = NumArray(i);

        /* NO: Promo doesnt have TIC Promotion Category */
        IF cnt = 0 THEN
            DBMS_OUTPUT.PUT_LINE('WRONG: Promotion '|| NumArray(i) ||' Doesnt have Tax Included Credits');
            /* INSERT REFERENCE TO TIC PROMO CATEGORY */ 
            INSERT INTO nc_references (attr_id,reference,object_id,show_order,priority,attr_access_type)
            VALUES
            ( 
                9153770145313318210, /* ATTR_ID : Promotion Type */                
                9153779179813323603, /* REFERENCE :  Tax Included Credits */
                NumArray(i),
                6,
                0,
                0
            );
        END IF;

        /* Price Alteration has referece to tax code? */
        SELECT COUNT(*) INTO cnt FROM nc_references 
        WHERE attr_id = 9142883780313111933  /* ATTR_ID: Tax Code */ 
        AND object_id = (SELECT object_id  FROM nc_objects nco WHERE parent_id = NumArray(i));

        /*NO: INSERT REFERENCE TO 9998 */
        IF cnt = 0 THEN
            INSERT INTO  nc_references (attr_id,reference,object_id,show_order,priority,attr_access_type)
            VALUES
            (
                9142883780313111933, /* Tax Code attr */
                9164799782513550301, /* 9998 ref */
                (SELECT object_id  FROM nc_objects nco WHERE parent_id = NumArray(i)), /* Alteration Price Component */
                1,
                0,
                0
            );

        /*YES: UPDATE REFERENCE TO 9998 */
        ELSE
            UPDATE nc_references SET 
            reference = 9164799782513550301 /* 9998 ref*/
            WHERE
            attr_id = 9142883780313111933   /* Tax Code attr */
            AND 
            object_id = (SELECT object_id  FROM nc_objects nco WHERE parent_id = NumArray(i)); /* Alteration Price Component */

        END IF;
        DBMS_OUTPUT.PUT_LINE('Promotion: '|| NumArray(i) ||' Successfully Updated');
    END LOOP;
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO before_datafix;
        DBMS_OUTPUT.PUT_LINE('E X C E P T I O N');
        v_code := SQLCODE;
        v_errm := SUBSTR(SQLERRM, 1, 64);
        DBMS_OUTPUT.PUT_LINE (v_code || ' ' || v_errm);

END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    VALIDATE_YES_OPTIK
    (
        NumberArrayType
        (
            9154560597613899784
        )
    );
END;
/

SELECT object_id FROM nc_objects nco WHERE parent_id IN
(
    9154560597613899784
)

UNION

SELECT object_id FROM nc_objects WHERE object_id IN
(
    9154560597613899784
);