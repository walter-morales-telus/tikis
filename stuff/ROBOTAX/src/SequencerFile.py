import copy
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
        print("correlative: " + str(ncobject['correlative']) + "object_id:" + str(ncobject['object_id']) + " promo_name:" + ncobject['promo_name'])

        Recorder.stLog.sequence_name = "Check Price Alteration"
        Recorder.stLog.correlative   = ncobject['correlative']
        Recorder.stLog.object_id     = ncobject['object_id']
        
        stp01 = self.Stp.search_by_object_id(130,90,ncobject['object_id'])
        log_stp01 = copy.deepcopy(Recorder.stLogStepper)
        Recorder.stLog.Stepper_list.append(log_stp01)
        
        if not stp01:
            print("Estos son los logs: ----->", Recorder.stLog)
            sys.exit()

        stp02 = self.Stp.select_first_ProdOfferingPriceAlterationDiscount()
        if not stp02:
            ncobject['has_price_alteration'] = False
        else:
            ncobject['has_price_alteration'] = True
        
        self.Dh.update_json_file(self.json_url,ncobject['object_id'],ncobject)
        time.sleep(2)

        

        #self.Dw.draw_small_x(130,90,self.Dw.purple)
        #pyautogui.click(130,90) 
        #time.sleep(2)
        
        #self.click_on(IMGTemplates.NC_TXT_SEARCH,0.60,0,0)

        #pyautogui.hotkey('ctrl', 'a')
        #pyautogui.press('backspace')
        #pyperclip.copy(ncobject['object_id'])
        #pyautogui.hotkey('ctrl', 'v')
        #time.sleep(2)

        #self.click_on(IMGTemplates.NAME,0.70,25,53)
        #self.click_on(IMGTemplates.PROMOTION_PATTERNS,0.70,0,0)

        #pyautogui.scroll(-500) 
        #time.sleep(2)

        #self.click_on(IMGTemplates.ACTIONS,0.70,0,0)

        #elf.click_on(IMGTemplates.AWARD,0.80,25,60)

        #price_alteration_exists = self.click_on(IMGTemplates.BLUE_DETAILS,0.80,0,0)

        #if price_alteration_exists:
            #ncobject['has_price_alteration'] = True
        #else:
            #ncobject['has_price_alteration'] = False
        
        
'''
def get_middle_point(self,rectangles):
        
        middle = -1,-1
        for (x,y,w,h) in rectangles:
            middle = x + (w // 2),y + (h // 2)
        #middle = rectangles[0] + (rectangles[0].w // 2),rectangles[0].y + (rectangles[0].h // 2)
        return middle

    def click_on(self,template,confidence,x_displacement,y_displacement):

        #ci[1] == 65543 = Text
        #ci[1] == 65541 = Cursor
        #ci[1] == 65569 = Hand

        ncsearch = pyautogui.locateCenterOnScreen(template, confidence = confidence)
        if(ncsearch == None):
            print("Template: "+template+" Not Found")
            return False
        else:
            print(ncsearch)
        x,y = ncsearch

        img = cv2.imread(template)
        h, w = img.shape[:2]

        self.Dw.draw_frame_by_center(x,y,w,h,self.Dw.blue)
        self.Dw.draw_small_x(x + x_displacement,y + y_displacement,self.Dw.red)
        time.sleep(2)

        pyautogui.moveTo(x + x_displacement,y + y_displacement)
        time.sleep(2)

        hc = win32gui.LoadCursor(0,win32con.IDC_HAND)  #Get the handle of cursor you need
        ci = win32gui.GetCursorInfo()  #Get the handle of the current cursor

        if(ci[1] == hc):
            print("Hand is On")
            pyautogui.click()
        else:
            print("Hand is Off")
            self.Dw.draw_small_x(x + x_displacement,y + y_displacement,self.Dw.green)
            pyautogui.click(x + x_displacement,y + y_displacement + 10)

        time.sleep(2)
        return True
'''
       




