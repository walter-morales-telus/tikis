import csv
import json
import sys

class DocHandler:
    
    def __init__(self):
        pass

    def convert_csv_to_json(self,csv_url):
        content = {}
        ncobjects = []
        content['ncobjects'] = ncobjects

        with open(csv_url, newline='') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                tmp = {}
                tmp['object_id']                           = int(row['NC Object Id'])
                tmp['promo_name']                          = row['Promo name']
                tmp['billing_offer_id']                    = int(row['Billing Offer Id'])

                optv = row['OPTIK TV Tax Included Offer']
                tmp['optik_tv_tax_included_offer']         = True if optv == 'Y' else False

                promc = row['Promo Categories']
                tmp['promo_categories']                    = None if promc == '[NULL]' else row['Promo Categories']

                tmp['has_price_alteration']        = None
                tmp['is_sync_to_legacy']           = None
                tmp['has_charge_or_revenue']       = None

                ncobjects.append(tmp)
        
        self.create_json_file(content,'./Docs/offerings.json')

    def create_json_file(self,content,json_url):
        with open(json_url, "w") as outfile:
            json.dump(content, outfile)
            
    
    def update_json_file(self,json_url,object_id,updated_object):
        
        with open(json_url, 'r') as openfile:
            json_object = json.load(openfile)

        for ncobjects in json_object['ncobjects']:
            if(ncobjects['object_id'] == object_id):
                try:
                    ncobjects['object_id'] = updated_object
                    with open(json_url, 'w') as jsf:
                        json.dump(json_object, jsf)
                    sys.exit()
                except Exception:
                    print(Exception)
                    sys.exit()

    
    def load_json_file(self,json_url):
        json_object = {}
        with open(json_url, 'r') as openfile:
            json_object = json.load(openfile)
        return json_object




'''
        json_file = './db/db.json'

        with open(json_file, 'r') as openfile:
            json_object = json.load(openfile)

        tmp = {}
        plus = 1
        listing = []
        for ncobjects in json_object['ncobjects']: 
            
            listing.append(ncobjects)
            if(ncobjects['correl'] / 10 == plus):
                
                name = './db/comp/file'+str(plus - 1)+'.json'
                tmp['ncobjects']=listing
                with open(name, 'w') as jsf:
                    json.dump(tmp, jsf)
                tmp = {}
                listing = []
                plus = plus + 1
     
    def json_handler(json_file):

        #json_file = './db/db.json'

        with open(json_file, 'r') as openfile:
            json_object = json.load(openfile)

        for ncobjects in json_object['ncobjects']:
            if(ncobjects['completed']==False and ncobjects['tax_code'] == '9999'):
                try:
                    start_automata(ncobjects)
                    ncobjects['completed'] = True
                    with open(json_file, 'w') as jsf:
                        json.dump(json_object, jsf)
                    sys.exit()
                except Exception:
                    print(Exception)
                    sys.exit()
'''