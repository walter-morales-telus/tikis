/* 1. All NC Promotions that map to these Offer IDs */

/* OPTIK ---> AA:Y & AC:Y --> OPTIK TV Tax Included Credits */
/* Non-OPTIK AA:Y and AC: N --> non-OPTIK Included Credits */
select ncp.object_id,sub.name,ncp.value from nc_params ncp, 
(
    select * from nc_objects where object_type_id = 9133383350013199423 /* Promotion */
)sub
where
ncp.object_id = sub.object_id
and
attr_id = 9141427476213952559 /* Billing Offer ID */
and
value in 
(
    32369,34208,34383,34384,39326,39327,
    430933,430943,431103,446503,456993,
    20319748,20449198,20449398,20632798,20908158,20908248,20955518,21070968,21071008,21071048,21071188,21071228,21088278,
    21088288,21117658,21139018,21139028,21139038,21175858,21175898,21175918,40641291,40659051,40659111,40659121,40659131,
    40659141,40678711,40678881,40699051,40706241,40737491,40760721,40760781,40760791,40760801,40760811,40760821,40760831,
    40760841,40760861,40760871,40760881,40760891,40760901,40760911,40760921,40760931,40763731,40763851,40775691,40786761,
    40833401,40833411,40833421,40833431,40833441,40833451,40833461,40833471,40833481,40833491,40833501,40849181,40858481,
    40858491,40858501,40858511,40865831,40865841,40865851,40865861,40865871,40865881,40865891,40865901,40868441,40882141,
    40882151,40882161,40882171,40883471,40883511,40883551,40883591,40883631,40884641,40886261,40886281,40886291,40886301,
    40886311,40886321,40978474,40978674,40978684,40978694,40978804,41074731,41074741,41074751,41074761,41076741,41076771,
    41112451,41112461,41112471,41117191,41118021,41133461,41163186,41174381,41180181,41180191,41180201,41180211,41180221,
    41184321,41184331,41184341,41208391,41213601,41213611,41213621,41220041,41224321,41224331,41224341,41224351,41224361,
    41224371
)
order by ncp.value desc;


select ncp.object_id,sub.name,ncp.value from nc_params ncp, 
(
    select * from nc_objects where object_type_id = 9133383350013199423 /* Promotion */
)sub
where
ncp.object_id = sub.object_id
and
attr_id = 9141427476213952559 /* Billing Offer ID */
and
value in 
(
    419237,419287,419297,424113,440653,440663,440843,
    20374028,20857298,20857338,20955338,20955378,21071768,21071848,21071888,21071968,21085178,21088228,21088238,21117698,21176928,21176938,
    21176948,21176958,21176968,40641101,40641251,40658801,40658841,40658881,40658981,40658991,40659545,40659585,40659625,40659635,40659645,
    40685061,40734101,40760771,40761001,40761131,40761201,40761211,40761281,40761321,40761361,40761401,40761441,40761451,40761521,40761561,
    40761601,40761641,40761681,40761721,40761761,40761801,40761841,40761881,40761951,40762051,40762151,40762251,40762351,40762831,40763681,
    40763691,40763701,40763711,40763721,40763741,40763751,40763761,40763771,40763781,40763791,40763801,40763811,40763821,40763831,40763841,
    40763861,40763871,40763881,40763891,40763901,40763911,40771891,40775481,40775571,40777241,40777291,40777351,40777411,40777471,40777531,
    40777781,40777831,40777881,40777931,40777981,40784341,40784351,40786771,40786781,40791271,40794711,40798081,40820141,40820151,40820161,
    40820171,40833991,40834031,40834071,40834111,40834151,40834191,40842391,40842401,40857171,40858481,40858491,40858501,40858511,40867231,
    40867501,40867511,40868581,40868621,40868661,40869641,40869651,40869661,40869671,40869681,40870251,40870261,40870271,40870281,40870291,
    40870741,40870751,40870761,40870771,40870781,40871231,40871241,40871251,40871261,40871271,40873591,40874981,40875211,40875971,40881021,
    40881061,40881101,40881751,40883711,40883941,40884101,40884111,40884121,40884131,40885201,40885241,40885251,40885261,40885271,40885281,
    40888841,40888911,40888921,40888991,40892941,40892981,40893531,40900551,40900561,40900571,40900581,40900591,40900601,40900611,40902591,
    40978601,40978794,40978844,40978964,40979004,40979164,40979174,40979184,40979324,40979334,40979344,40979384,40979394,40979404,40979414,
    40979424,40979464,40981001,40981041,40981461,40981761,40981771,40982324,41003301,41008081,41014691,41014701,41014711,41014721,41014731,
    41014741,41014751,41014761,41014771,41074801,41075511,41076071,41076081,41076721,41076731,41076751,41076761,41077001,41077041,41079701,
    41090701,41090711,41110011,41111791,41114241,41116521,41119127,41127271,41127281,41127291,41127301,41127311,41127321,41131951,41131961,
    41131971,41132491,41132501,41133111,41134011,41134041,41134831,41134841,41135791,41135801,41135811,41135821,41177421,41177431,41177441,
    41177451,41177461,41177471,41177481,41177491,41177501,41178061,41178071,41178281,41178291,41178301,41180481,41180531,41180541,41180571,
    41184351,41184361,41200301,41200441,41200451,41201161,41202581,41202591,41202601,41202611,41202621,41202631,41202641,41202651,41202661,
    41202671,41202711,41206981,41206991,41208221,41208281,41213141,41213151,41213161,41213171,41213581,41213591,41213631,41213641,41213651,
    41217051,41217061,41217071,41217081,41221931,41221941,41221951,41221961,41221971,41223651,41223661,41223671,41223681,41223701,41224101,
    41224111,41224121,41224131,41224141,41225661,41230131,41230141,41230151
)
order by ncp.value desc;