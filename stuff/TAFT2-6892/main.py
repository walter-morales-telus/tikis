import sys
import webbrowser
import pyautogui
import time
import pyperclip

import json

import win32gui
import win32api


import asyncio



#https://pim-frontend-srv-cloud-bss-pr01.nc-gke-pr.tsl.telus.com/#/home

def draw_frame(x, y, width, height):
    dc = win32gui.GetDC(0)
    green = win32api.RGB(124,252,0)

    win32gui.SetPixel(dc, x, y, green)  # draw red at 0,0
    for i in range(x, x + width):

        win32gui.SetPixel(dc, i, y, green)
        win32gui.SetPixel(dc, i, y + height, green)

        win32gui.SetPixel(dc, i+1, y+1, green)
        win32gui.SetPixel(dc, i+1, y+1 + height, green)

    for i in range(y, y + height):

        win32gui.SetPixel(dc, x, i, green)
        win32gui.SetPixel(dc, x + width, i, green)

        win32gui.SetPixel(dc, x+1, i+1, green)
        win32gui.SetPixel(dc, x + width+1, i+1, green)

    
def divi():

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

def start_automata(obj):
    print(obj)

    print("Starting...")
    print(obj['obj'])
    print(obj['correl'])
    time.sleep(5)

    #ncsearch = pyautogui.locateCenterOnScreen("./imuno/GPic/ncsearch.png", confidence = 0.9)
    pyautogui.click(140,140) 
    time.sleep(3)

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

    res = pyautogui.locateOnScreen("./imuno/GPic/home.png", confidence = 0.80)
    draw_frame(res.left+25, res.top+45, 5, 5)
    pyautogui.click(res.left+25, res.top+45)
    pyautogui.click(res.left+25, res.top+45)
    pyautogui.click(res.left+25, res.top+45) 
    pyautogui.hotkey('ctrl', 'c')

    nsk = pyperclip.paste()
    ols = nsk.replace('\n', '').replace('\r', '')
    obj['award']=ols+str(' Extended Entity')
    obj['pad']=ols
    time.sleep(3)

    ncsearch = pyautogui.locateCenterOnScreen("./imuno/GPic/copy.png", confidence = 0.70)
    pyautogui.click(ncsearch) 
    time.sleep(3)

    
    #ncsearch = pyautogui.locateCenterOnScreen("./imuno/GPic/ncsearch.png", confidence = 0.9)
    pyautogui.click(140,140) 
    time.sleep(3)

    ncsearch = pyautogui.locateCenterOnScreen("./imuno/GPic/tboxsearch.png", confidence = 0.60)
    pyautogui.click(ncsearch)  
    time.sleep(3)

    pyautogui.hotkey('ctrl', 'a')
    pyautogui.press('backspace')
    pyautogui.hotkey('ctrl', 'v')
    time.sleep(3)

    ncsearch = pyautogui.locateCenterOnScreen("./imuno/GPic/json.png", confidence = 0.80)
    pyautogui.click(ncsearch) 
    time.sleep(3)

    pyautogui.moveTo(732,405)
    pyautogui.dragTo(588,722, button='left', duration=1)
    pyautogui.hotkey('ctrl', 'c')
    hyper = pyperclip.paste()
    hyperdos = hyper.replace('\n', '').replace('\r', '').replace(' ', '')
    obj['extended_parameters']=hyperdos
    time.sleep(3)


def totxt(json_file):
    jsdir = './db/comp/'+json_file+'.json'
    with open(jsdir, 'r') as openfile:
        json_object = json.load(openfile)

    tmp = ''
    for ncobjects in json_object['ncobjects']:

        if(ncobjects['tax_code'] == ''):
            continue
        
        mini = ''
        try:
            mini += '************'+str(ncobjects['correl']) +'\n'
            mini += ncobjects['award'] +'\n'
            mini += ncobjects['type'] +'\n'
            mini += ncobjects['pad'] +'\n'
            mini += str(ncobjects['amount']) +'\n'
            mini += json.dumps(ncobjects['extended_parameters']) +'\n'
            mini += '************\n\n'
            tmp += mini

        except Exception as e:
            print(e)
            mini += '************\n\n'
            tmp += mini
            
    with open('./db/txt/'+json_file+'.txt', 'w') as f:
        f.write(tmp)
        



def getvalue(json_file):

    with open(json_file, 'r') as openfile:
        json_object = json.load(openfile)

    for ncobjects in json_object['ncobjects']:
        obj = ncobjects['obj']
        url = 'https://flcncapp-dv52.tsl.telus.com/common/uobject.jsp?tab=_Parameters&object=' + obj

        chrome_path="C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
        webbrowser.register('chrome', None,webbrowser.BackgroundBrowser(chrome_path))
        webbrowser.get('chrome').open_new_tab(url)
        time.sleep(2)

if __name__ == '__main__':
    #sys.exit(main())
    #asyncio.run()
    #json_handler()
    #divi()    
    json_handler('./db/comp/file13.json')
    #totxt('file9')
    #totxt('file10')
    #totxt('file11')
    #totxt('file12')
    #totxt('file13')
    #totxt('file14')
    #getvalue('./db/comp/file15.json')
