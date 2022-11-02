import sys
import time

import pyautogui
from DocHandlerFile import DocHandler
from DrawFile import Draw
from LocatorFile import Locator
from IMGTemplatesFile import IMGTemplates

class Sequencer:

    def __init__(self):
        self.x = -1
        self.y = -1
    
    def start_automata(self,json_url):
        Dh = DocHandler()
        json_content = Dh.load_json_file(json_url)

        for ncobject in json_content['ncobjects']:
            self.split_cases(ncobject)

    def split_cases(self,ncobject):

        self.do_task_check_price_alteratio(ncobject)
        '''
        Action 1:
        Condition: If promotion does not have price alteration
        Actions: 
            a- Skip it and mark it for review
        '''
    def get_middle_point(self,rectangles):
        
        middle = -1,-1
        for (x,y,w,h) in rectangles:
            middle = x + (w // 2),y + (h // 2)
        #middle = rectangles[0] + (rectangles[0].w // 2),rectangles[0].y + (rectangles[0].h // 2)
        return middle


    def do_task_check_price_alteratio(self,ncobject):
        print(ncobject)

        #NC Search Location
        time.sleep(3)
        pyautogui.click(140,140) 
        
        Lc = Locator()
        Dw = Draw()

        rectangles = Lc.multi_scale_locator(IMGTemplates.NC_TXT_SEARCH,0.99)
        Dw.draw_rectangles(rectangles)
        x,y = self.get_middle_point(rectangles)
        Dw.draw_small_square(x,y,Dw.purple)

        sys.exit()


        '''
        ncsearch = pyautogui.locateCenterOnScreen("./imuno/GPic/tboxsearch.png", confidence = 0.60)
        pyautogui.click(ncsearch)  
        time.sleep(3)

        pyautogui.hotkey('ctrl', 'a')
        pyautogui.press('backspace')
        pyperclip.copy(obj['obj'])
        pyautogui.hotkey('ctrl', 'v')
        time.sleep(3)

        res = pyautogui.locateOnScreen("./imuno/GPic/name.png", confidence = 0.7)
        draw_frame(res.left, res.top, res.width, res.height)
        draw_frame(res.left + 25, res.top+60, 5, 5)
        pyautogui.click(res.left + 25, res.top + 60)
        time.sleep(3)

        ncsearch = pyautogui.locateCenterOnScreen("./imuno/GPic/promop.png", confidence = 0.70)
        pyautogui.click(ncsearch) 
        time.sleep(3)

        pyautogui.scroll(-500) 
        time.sleep(3)

        ncsearch = pyautogui.locateCenterOnScreen("./imuno/GPic/actions.png", confidence = 0.70)
        pyautogui.click(ncsearch) 
        time.sleep(3)

        res = pyautogui.locateOnScreen("./imuno/GPic/award.png", confidence = 0.80)
        draw_frame(res.left+25, res.top+60, 5, 5)
        pyautogui.click(res.left+25, res.top+60) 
        time.sleep(3)
        '''

        




