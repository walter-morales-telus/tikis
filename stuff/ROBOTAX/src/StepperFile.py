import copy
import time
import pyautogui
from DrawFile import Draw
from IMGTemplatesFile import IMGTemplates
from LogFile import Recorder

from UInteractionFile import UInteraction


class Stepper:

    def __init__(self):
        self.Dw = Draw()
        self.Ui = UInteraction()

    #Step
    def search_by_object_id(self,x,y,object_id):
        Recorder.stLogStepper.name="search_by_object_id"

        self.Dw.draw_small_x(x,y,self.Dw.purple)
        pyautogui.click(130,90)
        time.sleep(2)

        passed = self.Ui.cv_paste(IMGTemplates.NC_TXT_SEARCH,0.60,object_id)
        if not passed:
            return False
        
        return True
        
    #Step
    def select_first_ProdOfferingPriceAlterationDiscount(self):

        Recorder.stLogStepper.name="select_first_ProdOfferingPriceAlterationDiscount"
        
        passed = self.Ui.cv_click(IMGTemplates.NAME,0.70,25,53)
        if not passed:
            return False

        passed = self.Ui.cv_click(IMGTemplates.PROMOTION_PATTERNS,0.70,0,0)
        if not passed:
            return False
        
        pyautogui.scroll(-500) 
        #time.sleep(2)
        
        passed = self.Ui.cv_click(IMGTemplates.ACTIONS,0.70,0,0)
        if not passed:
            return False

        passed = self.Ui.cv_click(IMGTemplates.AWARD,0.80,0,60)
        if not passed:
            return False

        price_alteration_exists = self.Ui.cv_click(IMGTemplates.BLUE_DETAILS,0.80,0,0)
        if price_alteration_exists:
            return True

        return False
    
    def check_sync_to_legacy(self):
        pass




    

