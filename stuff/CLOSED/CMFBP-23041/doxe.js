if (typeof importClass != "function") load("nashorn:mozilla_compat.js");

var contextVariables;
var executionStepNCID;

importClass(com.netcracker.solutions.customers.telus.aut.keyword.KeywordHelper);
importClass(com.netcracker.solutions.customers.telus.aut.keyword.NCData);
importClass(java.math.BigInteger);
importClass(com.google.gson.Gson);
importClass(com.google.gson.reflect.TypeToken);
importClass(java.lang.reflect.Type);

importPackage(java.util);

function gponQualified(){
	var gson = new Gson();
	var data = gson.fromJson(contextVariables.get("httpRequestData"), new java.util.HashMap().getClass());
	//var data = JSON.parse(contextVariables.get("httpRequestData"));
	
	KeywordHelper.debug("gponQualified data", data, executionStepNCID);
	var locationId = data.get("serviceQualificationItem").get(0).get("id");
	//var locationId = data.serviceQualificationItem[0].id.toFixed(0);
	contextVariables.put("locationId",locationId);
	KeywordHelper.debug("gponQualified locationId", locationId, executionStepNCID);
	var respTemplate = '{ "id": 100119, "qualificationResult": "qualified", "externalId": "serviceQualification", "description": "Service Qualification", "serviceQualificationItem": [ { "id": 100119, "qualificationResult": "qualified", "expectedServiceAvailabilityDate": null, "serviceSpecification": { "name": "GPON" }, "service": { "characteristic": [ { "name": "ServiceQualificationName", "value": "PureFiberConnectivity" }, { "name": "technologyType", "value": "fibre-pon" }, { "name": "orderingPlatform", "value": "FIFA" } ], "place": [ { "role": "installationAddress", "id": 100119 } ], "eligibilityUnavailabilityReason": [ { "code": "EC_ADD_GIS_NA" } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "26 Aug 2021 23:24:13", "serviceSpecification": { "name": "lte" }, "service": { "characteristic": [ { "name": "lteInstallDate", "value": "26 Aug 2021 23:24:13" }, { "name": "ServiceQualificationName", "value": "LTEConnectivity" }, { "name": "technologyType", "value": "lte" }, { "name": "orderingPlatform", "value": "FIFA" } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": null, "serviceSpecification": { "name": "wttx" }, "service": { "characteristic": [ { "name": "ServiceQualificationName", "value": "WTTxConnectivity" }, { "name": "wttxConnectivity", "value": "9150313760013156768" }, { "name": "technologyType", "value": "wttx" }, { "name": "orderingPlatform", "value": "FIFA" } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": null, "serviceSpecification": { "name": "XGSPON" }, "service": { "characteristic": [ { "name": "ServiceQualificationName", "value": "PureFiberConnectivity" }, { "name": "technologyType", "value": "fibre-pon" }, { "name": "orderingPlatform", "value": "FIFA" } ], "place": [ { "role": "installationAddress", "id": 100119 } ], "eligibilityUnavailabilityReason": [ { "code": "EC_ADD_GIS_NA" } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "2021 08 27 11:24:13", "serviceSpecification": { "name": "ADSL2+" }, "service": { "characteristic": [ { "name": "technologyType", "value": "copper" } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "2021 08 27 11:24:13", "serviceSpecification": { "name": "VDSL2" }, "service": { "characteristic": [ { "name": "technologyType", "value": "copper" }, { "name": "attainableMaxSpeed", "value": 55 }, { "name": "targetClli", "value": "KMLPBC01" }, { "name": "pathConnectedStatus", "value": "" }, { "name": "portAvailability", "value": "High" }, { "name": "bondingAvailability", "value": "Yes" }, { "name": "clearanceTN", "value": null }, { "name": "orderingPlatform", "value": "FIFA" } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "2021 08 27 11:24:13", "serviceSpecification": { "name": "VDSL2-Bonded" }, "service": { "characteristic": [ { "name": "technologyType", "value": "copper" }, { "name": "attainableMaxSpeed", "value": 104.5 }, { "name": "targetClli", "value": "KMLPBC01" }, { "name": "pathConnectedStatus", "value": "" }, { "name": "portAvailability", "value": "High" }, { "name": "bondingAvailability", "value": "Yes" }, { "name": "clearanceTN", "value": null }, { "name": "orderingPlatform", "value": "" } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "2021 08 27 11:24:13", "serviceSpecification": { "name": "POTS" }, "service": { "characteristic": [ { "name": "technologyType", "value": "copper" }, { "name": "pathConnectedStatus", "value": "SW" }, { "name": "clearanceTN", "value": null }, { "name": "orderingPlatform", "value": "" } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "2021-08-27T23:24:14.790Z", "serviceSpecification": { "name": "whsia-antenna" }, "service": { "characteristic": [ { "name": "serviceQualificationName", "value": "whsia-antenna" }, { "name": "technologyType", "value": "whsia-antenna" }, { "name": "orderingPlatform", "value": "FIFA" }, { "name": "stopSell", "value": false } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "2021-08-27T23:24:14.790Z", "serviceSpecification": { "name": "whsia-standard" }, "service": { "characteristic": [ { "name": "serviceQualificationName", "value": "whsia-standard" }, { "name": "technologyType", "value": "whsia-standard" }, { "name": "orderingPlatform", "value": "FIFA" }, { "name": "stopSell", "value": false } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "2021-01-26T18:10:47.027Z", "serviceSpecification": { "name": "whsia-5G" }, "service": { "characteristic": [ { "name": "serviceQualificationName", "value": "whsia-5G" }, { "name": "technologyType", "value": "whsia-5G" }, { "name": "orderingPlatform", "value": "FIFA" }, { "name": "attainableMaxSpeed", "value": 100 }, { "name": "stopSell", "value": false } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } }, { "id": 100119, "qualificationResult": "not-qualified", "expectedServiceAvailabilityDate": "2021-08-27T23:24:14.790Z", "serviceSpecification": { "name": "wireless-lte" }, "service": { "characteristic": [ { "name": "serviceQualificationName", "value": "wireless-lte" }, { "name": "technologyType", "value": "wireless-lte" }, { "name": "orderingPlatform", "value": "FIFA" } ], "place": [ { "role": "installationAddress", "id": 100119 } ] } } ] }';
	
	//Responding
	contextVariables.put("API_RESPONSE", respTemplate);
}

/* Backup */
/*

if (typeof importClass != "function") load("nashorn:mozilla_compat.js");

var contextVariables;
var executionStepNCID;

importClass(com.netcracker.solutions.customers.telus.aut.keyword.KeywordHelper);
importClass(com.netcracker.solutions.customers.telus.aut.keyword.NCData);
importClass(java.math.BigInteger);
importClass(com.google.gson.Gson);
importClass(com.google.gson.reflect.TypeToken);
importClass(java.lang.reflect.Type);

importPackage(java.util);

function gponQualified(){
	var gson = new Gson();
	var data = gson.fromJson(contextVariables.get("httpRequestData"), new java.util.HashMap().getClass());
	//var data = JSON.parse(contextVariables.get("httpRequestData"));
	
	KeywordHelper.debug("gponQualified data", data, executionStepNCID);
	var locationId = data.get("serviceQualificationItem").get(0).get("id");
	//var locationId = data.serviceQualificationItem[0].id.toFixed(0);
	contextVariables.put("locationId",locationId);
	KeywordHelper.debug("gponQualified locationId", locationId, executionStepNCID);
	var respTemplate = '{"id":100119,"qualificationResult":"qualified","externalId":"serviceQualification","description":"Service Qualification","serviceQualificationItem":[{"id":100119,"qualificationResult":"not-qualified","expectedServiceAvailabilityDate":null,"serviceSpecification":{"name":"GPON"},"service":{"characteristic":[{"name":"ServiceQualificationName","value":"PureFiberConnectivity"},{"name":"technologyType","value":"fibre-pon"},{"name":"orderingPlatform","value":"FIFA"}],"place":[{"role":"installationAddress","id":100119}],"eligibilityUnavailabilityReason":[{"code":"EC_ADD_GIS_NA"}]}},{"id":100119,"qualificationResult":"qualified","expectedServiceAvailabilityDate":"26 Aug 2021 23:24:13","serviceSpecification":{"name":"lte"},"service":{"characteristic":[{"name":"lteInstallDate","value":"26 Aug 2021 23:24:13"},{"name":"ServiceQualificationName","value":"LTEConnectivity"},{"name":"technologyType","value":"lte"},{"name":"orderingPlatform","value":"FIFA"}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"not-qualified","expectedServiceAvailabilityDate":null,"serviceSpecification":{"name":"wttx"},"service":{"characteristic":[{"name":"ServiceQualificationName","value":"WTTxConnectivity"},{"name":"wttxConnectivity","value":"9150313760013156768"},{"name":"technologyType","value":"wttx"},{"name":"orderingPlatform","value":"FIFA"}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"not-qualified","expectedServiceAvailabilityDate":null,"serviceSpecification":{"name":"XGSPON"},"service":{"characteristic":[{"name":"ServiceQualificationName","value":"PureFiberConnectivity"},{"name":"technologyType","value":"fibre-pon"},{"name":"orderingPlatform","value":"FIFA"}],"place":[{"role":"installationAddress","id":100119}],"eligibilityUnavailabilityReason":[{"code":"EC_ADD_GIS_NA"}]}},{"id":100119,"qualificationResult":"not-qualified","expectedServiceAvailabilityDate":"2021 08 27 11:24:13","serviceSpecification":{"name":"ADSL2+"},"service":{"characteristic":[{"name":"technologyType","value":"copper"}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"not-qualified","expectedServiceAvailabilityDate":"2021 08 27 11:24:13","serviceSpecification":{"name":"VDSL2"},"service":{"characteristic":[{"name":"technologyType","value":"copper"},{"name":"attainableMaxSpeed","value":55},{"name":"targetClli","value":"KMLPBC01"},{"name":"pathConnectedStatus","value":""},{"name":"portAvailability","value":"High"},{"name":"bondingAvailability","value":"Yes"},{"name":"clearanceTN","value":null},{"name":"orderingPlatform","value":"FIFA"}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"not-qualified","expectedServiceAvailabilityDate":"2021 08 27 11:24:13","serviceSpecification":{"name":"VDSL2-Bonded"},"service":{"characteristic":[{"name":"technologyType","value":"copper"},{"name":"attainableMaxSpeed","value":104.5},{"name":"targetClli","value":"KMLPBC01"},{"name":"pathConnectedStatus","value":""},{"name":"portAvailability","value":"High"},{"name":"bondingAvailability","value":"Yes"},{"name":"clearanceTN","value":null},{"name":"orderingPlatform","value":""}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"not-qualified","expectedServiceAvailabilityDate":"2021 08 27 11:24:13","serviceSpecification":{"name":"POTS"},"service":{"characteristic":[{"name":"technologyType","value":"copper"},{"name":"pathConnectedStatus","value":"SW"},{"name":"clearanceTN","value":null},{"name":"orderingPlatform","value":""}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"qualified","expectedServiceAvailabilityDate":"2021-08-27T23:24:14.790Z","serviceSpecification":{"name":"whsia-antenna"},"service":{"characteristic":[{"name":"serviceQualificationName","value":"whsia-antenna"},{"name":"technologyType","value":"whsia-antenna"},{"name":"orderingPlatform","value":"FIFA"},{"name":"stopSell","value":false}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"qualified","expectedServiceAvailabilityDate":"2021-08-27T23:24:14.790Z","serviceSpecification":{"name":"whsia-standard"},"service":{"characteristic":[{"name":"serviceQualificationName","value":"whsia-standard"},{"name":"technologyType","value":"whsia-standard"},{"name":"orderingPlatform","value":"FIFA"},{"name":"stopSell","value":false}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"qualified","expectedServiceAvailabilityDate":"2021-01-26T18:10:47.027Z","serviceSpecification":{"name":"whsia-5G"},"service":{"characteristic":[{"name":"serviceQualificationName","value":"whsia-5G"},{"name":"technologyType","value":"whsia-5G"},{"name":"orderingPlatform","value":"FIFA"},{"name":"attainableMaxSpeed","value":100},{"name":"stopSell","value":false}],"place":[{"role":"installationAddress","id":100119}]}},{"id":100119,"qualificationResult":"qualified","expectedServiceAvailabilityDate":"2021-08-27T23:24:14.790Z","serviceSpecification":{"name":"wireless-lte"},"service":{"characteristic":[{"name":"serviceQualificationName","value":"wireless-lte"},{"name":"technologyType","value":"wireless-lte"},{"name":"orderingPlatform","value":"FIFA"}],"place":[{"role":"installationAddress","id":100119}]}}]}';
	
	//Responding
	contextVariables.put("API_RESPONSE", respTemplate);
}


*/