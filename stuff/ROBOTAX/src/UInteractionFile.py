import time
import cv2
import pyautogui
import pyperclip
import win32gui
import win32con

import copy

from IMGTemplatesFile import IMGTemplates
from LogFile import LogMicroTask, Recorder


class UInteraction:

    def __init__(self):
        pass

    def paste_value_to_textbox(self,template,confidence,value):
        
        # Click to TextBox
        passed = self.click(template,confidence)
        Recorder.stLogMicroTask.name = "Click to TextBox"
        lmtask01 = copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lmtask01)

        if not passed:
            return False

        # Paste from Clipboard
        try:
            pyautogui.hotkey('ctrl', 'a')
            pyautogui.press('backspace')
            pyperclip.copy(value)
            pyautogui.hotkey('ctrl', 'v')
            time.sleep(1)
            Recorder.stLogMicroTask = LogMicroTask("Paste from Clipboard","","","",True)
            lmtask02 = copy(Recorder.stLogMicroTask)
            Recorder.stLogStepper.micro_tasks_list.append(lmtask02)
        except Exception as e: 
            Recorder.stLogMicroTask = LogMicroTask("Paste from Clipboard","","",str(e),False)
            lmtask02 = copy(Recorder.stLogMicroTask)
            Recorder.stLogStepper.micro_tasks_list.append(lmtask02)
            return False
        
        return True
        

    def click(self,template,confidence):
        return self.click(template,confidence,0,0)

    def click(self,template,confidence,x_displacement,y_displacement):

        #ci[1] == 65543 = Text
        #ci[1] == 65541 = Cursor
        #ci[1] == 65569 = Hand
        
        ncsearch = pyautogui.locateCenterOnScreen(template, confidence = confidence)
        if(ncsearch == None):
            tmp = template.split("\\")
            template_file_name = tmp[len(tmp) - 1]
            Recorder.stLogMicroTask = LogMicroTask("",template,"Template " + template_file_name +" Not Found","",False)
            print("Template: " + template + " Not Found")
            return False
        else:
            Recorder.stLogMicroTask = LogMicroTask("",template,"Template " + template_file_name +" Found","",True)
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
        ci = win32gui.GetCursorInfo()                  #Get the handle of the current cursor

        if(ci[1] == hc):
            print("Hand is On")
            pyautogui.click()
        else:
            print("Hand is Off")
            self.Dw.draw_small_x(x + x_displacement,y + y_displacement,self.Dw.green)
            pyautogui.click(x + x_displacement,y + y_displacement + 10)

        time.sleep(2)
        return True
