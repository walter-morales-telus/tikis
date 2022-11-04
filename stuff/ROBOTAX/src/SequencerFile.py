import sys

from DocHandlerFile import DocHandler
from LogFile import  Recorder
from StepperFile import Stepper

class Sequencer:

    def __init__(self,json_url):
        self.json_url = json_url

        self.Dh  = DocHandler()
        self.Stp = Stepper()
    
    def start_automata(self,json_url):
        json_content = self.Dh.load_json_file(json_url)
        for ncobject in json_content['ncobjects']:
            self.do_task_check_price_alteratio(ncobject)

    def do_task_check_price_alteratio(self,ncobject):
        print("correlative:   " + str(ncobject['correlative']) + "\n  object_id:   " + str(ncobject['object_id']) + "\n promo_name:   " + ncobject['promo_name']+"\n")

        Recorder.stLog.sequence_name = "Check Price Alteration"
        Recorder.stLog.correlative   = ncobject['correlative']
        Recorder.stLog.object_id     = ncobject['object_id']
        
        stp01 = self.Stp.search_by_object_id(130,90,ncobject['object_id'])
        Recorder.add_new_step_to_sequence()

        if not stp01:
            sys.exit()

        stp02 = self.Stp.select_first_ProdOfferingPriceAlterationDiscount()
        Recorder.add_new_step_to_sequence()
        
        if not stp02:
            ncobject['has_price_alteration'] = False
        else:
            ncobject['has_price_alteration'] = True
        
        self.Dh.update_json_file(self.json_url,ncobject['object_id'],ncobject)
        self.Dh.print_logs()

        sys.exit()


    