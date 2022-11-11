DECLARE
    cnt NUMBER := 0;
    TYPE nt_type IS TABLE of NUMBER;
    nt nt_type := nt_type 
    (
        9150980333813849805,
        9151925201113290673,
        9154271733013486061,
        9154692001813568889,
        9154692001813568893,
        9154692001813568897,
        9154692129613568901,
        9154692129613568905,
        9154692129613568909,
        9154692129613568913,
        9154692129613568917,
        9154692129613568921,
        9154692129613568925,
        9154692129613568929,
        9154692129613568933,
        9154692129613568937,
        9154692129613568941,
        9154692129613568945,
        9154692129613568949,
        9154692129613568953,
        9154692129613568957,
        9154692129613568961,
        9154692129613568965,
        9154692129613568969,
        9154692129613568973,
        9154692129613568977,
        9154692129613568978,
        9154692129613568982,
        9154692129613568986,
        9154692129613568990,
        9154692129613568994,
        9154692129913568998,
        9154692129913569002,
        9158790674113702965,
        9160012009013187857,
        9160012035913187862,
        9160012036113187867,
        9160012036413187872,
        9161222650113221605,
        9161222652713221610,
        9161222654213221615,
        9161222655213221620,
        9161222656313221625,
        9161222657413221630,
        9161223713013222506,
        9161223716813222511,
        9161223718113222516,
        9161223720213222521,
        9161223721413222526,
        9161223722613222531,
        9161224717713224534,
        9161224719013224539,
        9161224721013224544,
        9161230800513227915,
        9161230802513227920,
        9161230803813227930,
        9162796287276662087,
        9162796325968685273,
        9154271595413485950,
        9154271693713486056,
        9154692001813568873,
        9154692001813568877,
        9154692001813568881,
        9154692001813568885,
        9160554363213310966,
        9150944262413969543,
        9151005862813862758,
        9151057160813833504,
        9151890865813401611,
        9152091525813667718,
        9152567093913594071,
        9152567276213594176,
        9152567340813594182,
        9152618804913625909,
        9152643845413658747,
        9153432664013999139,
        9153468677413047005,
        9153483302613036871,
        9153483365113036905,
        9153483402213036935,
        9153483746613298515,
        9153554201913155252,
        9153717400113368902,
        9153717422013368907,
        9153717473513369012,
        9153717542313369102,
        9153717566613369107,
        9153717629413369307,
        9153717711013369327,
        9153717734113369332,
        9153717749813369337,
        9153717782313369347,
        9153717822913369357,
        9153717848413369372,
        9153986117113415211,
        9153986490713415611,
        9154021028713794602,
        9154621480513967287,
        9155640264713412439,
        9155641510413415144,
        9155668372813436834,
        9155668376813436849,
        9155680109713185807,
        9155680147713185902,
        9155680171113186007,
        9155680232013186102,
        9155680310413186202,
        9155680349813186302,
        9156318085613509302,
        9156318707213509702,
        9156318761713509802,
        9156318761813509806,
        9156318781313509811,
        9156318781313509815,
        9156318781313509819,
        9156318781313509823,
        9156318796313509828,
        9156367732313137619,
        9156453501513215327,
        9156623088113268181,
        9156623856513268510,
        9158397432313447182,
        9158784839513258671,
        9158805239013113715,
        9159047553313916415,
        9159053855413919572,
        9159418272913184696,
        9159426416813519453,
        9159751225513568886,
        9160063948213998634,
        9160914217113079669,
        9160915016513080098,
        9161139787313174686,
        9161139804913174691,
        9162497187421737069,
        9162497211144804608,
        9151859609313888639,
        9151859764813889039,
        9151859797513889044,
        9151859802813889049,
        9151859807513889054,
        9151859811813889059,
        9151859817213889064,
        9151859824613889069,
        9151859828713889074,
        9151948022213944339,
        9151948022213944343,
        9151948022213944347,
        9151948022213944351,
        9151948022213944355,
        9151948022213944359,
        9151948034213944364,
        9151948034213944368,
        9151948034213944372,
        9151948040913944439,
        9151948041013944443,
        9151948041013944447,
        9151948041013944451,
        9151948041013944455,
        9151948057313944460,
        9151948057313944464,
        9151948057313944468,
        9159465603313471964,
        9159465603413471969,
        9159465603413471974,
        9159465603413471979,
        9160003166413174959,
        9160003599013175364,
        9160003978313175886,
        9160004013513176209,
        9160554850813311283,
        9160554958313311290,
        9160555015713311295,
        /*---------------*/
        9154691807313568794,
        9154692001813568798,
        9154692001813568853,
        9154696399613572369,
        9158639877213023859,
        9158794763513573288,
        9158855419713694859,
        9158860879013728466,
        9150145284413952802,
        9150145324513952807,
        9150145381213952812,
        9150145498213952917,
        9150145579913952922,
        9150145600313952927
    );
BEGIN
    SAVEPOINT before_dormant;
    FOR i IN 1..nt.count LOOP
        SELECT COUNT(*) INTO cnt FROM nc_references WHERE attr_id = 9142883780313111933 AND object_id = (SELECT object_id  FROM nc_objects nco WHERE parent_id = nt(i));
        IF cnt = 0 THEN
            BEGIN
                INSERT INTO  nc_references (attr_id,reference,object_id,show_order,priority,attr_access_type)
                VALUES
                (
                    /*Tax Code attr*/
                    9142883780313111933,
                    /*9999 ref*/
                    9153786500813327277,
                    /*Alteration Price Component*/
                    (SELECT object_id  FROM nc_objects nco WHERE parent_id = nt(i)),
                    1,
                    0,
                    0
                );
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('TaxCode 9999 Successfully added to: ' || nt(i));
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK TO before_dormant;
                DBMS_OUTPUT.PUT_LINE('EXCEPTION WITH OBJECT_ID: ' || nt(i));
            END;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Alteration Price Component has already a TaxCode: ' || nt(i)));
        END IF;
    END LOOP;
END;
/



























