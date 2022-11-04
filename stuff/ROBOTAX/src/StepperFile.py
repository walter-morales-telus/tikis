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
        time.sleep(1)

        passed = self.Ui.paste_value_to_textbox(IMGTemplates.NC_TXT_SEARCH,0.60,object_id)
        if not passed:
            return False
        
        return True
        
    #Step
    def select_first_ProdOfferingPriceAlterationDiscount(self):

        Recorder.stLogStepper.name="select_first_ProdOfferingPriceAlterationDiscount"
        
        passed = self.Ui.click(IMGTemplates.NAME,0.70,25,53)
        template = Recorder.stLogMicroTask.template
        Recorder.stLogMicroTask.name = "Click to " + template
        lmtask = copy.copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lmtask)
        if not passed:
            return False

        passed = self.Ui.click(IMGTemplates.PROMOTION_PATTERNS,0.70,0,0)
        lmtask = copy.copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lmtask)
        if not passed:
            return False
        
        pyautogui.scroll(-500) 
        time.sleep(2)
        
        passed = self.Ui.click(IMGTemplates.ACTIONS,0.70,0,0)
        lmtask = copy.copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lmtask)
        if not passed:
            return False

        passed = self.Ui.click(IMGTemplates.AWARD,0.80,25,60)
        lmtask = copy.copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lmtask)
        if not passed:
            return False
        
        lmtask = copy.copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lmtask)
        price_alteration_exists = self.Ui.click(IMGTemplates.BLUE_DETAILS,0.80,0,0)
        if price_alteration_exists:
            return True

        return False
    
    def check_sync_to_legacy(self):
        pass




    

