import copy
import json
import sys
import time
import cv2

import pyautogui
import pyperclip
import win32gui
import win32con
from DocHandlerFile import DocHandler
from DrawFile import Draw
from LocatorFile import Locator
from IMGTemplatesFile import IMGTemplates
from LogFile import Log, Recorder
from StepperFile import Stepper
from UInteractionFile import UInteraction

class Sequencer:

    def __init__(self,json_url):
        self.json_url = json_url
        self.Dw  = Draw()
        self.Dh  = DocHandler()
        self.Stp = Stepper()
        self.Lg  = Log()
       
    
    def start_automata(self,json_url):
        json_content = self.Dh.load_json_file(json_url)
        for ncobject in json_content['ncobjects']:
            self.do_task_check_price_alteratio(ncobject)



    def do_task_check_price_alteratio(self,ncobject):
        print("correlative: " + str(ncobject['correlative']) + "\nobject_id:" + str(ncobject['object_id']) + "\npromo_name:" + ncobject['promo_name']+"\n")

        Recorder.stLog.sequence_name = "Check Price Alteration"
        Recorder.stLog.correlative   = ncobject['correlative']
        Recorder.stLog.object_id     = ncobject['object_id']
        
        stp01 = self.Stp.search_by_object_id(130,90,ncobject['object_id'])
        lgs = copy.deepcopy(Recorder.stLogStepper)
        Recorder.stLog.Stepper_list.append(lgs)

        if not stp01:
            sys.exit()

        stp02 = self.Stp.select_first_ProdOfferingPriceAlterationDiscount()
        lgs = copy.deepcopy(Recorder.stLogStepper)
        Recorder.stLog.Stepper_list.append(lgs)
        
        if not stp02:
            ncobject['has_price_alteration'] = False
        else:
            ncobject['has_price_alteration'] = True
        
        self.Dh.update_json_file(self.json_url,ncobject['object_id'],ncobject)
        self.Dh.print_logs()


    