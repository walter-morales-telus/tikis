import sys
import cv2
import pyautogui
import numpy as np
import imutils

from IMGTemplatesFile import IMGTemplates

class Plane:

    def __init__(self,image):
        pass

'''
    def __init__(self,image,x_center,y_center):
        image = image
        if(image != None):
            self.height, self.width = image.shape[:2]    
        self.x_center = x_center
        self.y_center = y_center
        self.x_sup_left_corner = (self.x_center // 2)
        self.y_sup_left_corner = (self.y_center // 2)

        self.width  = 0
        self.height = 0
'''
    

class Locator:

    def __init__(self):
        self.x = -1
        self.y = -1


    
    '''
    def locate_into_a_plane(enviroment,template,plane):

        pl = None
        template_url = IMGTemplates + template
        #enviroment = cv2.imread(enviroment_url)
        enviroment = pyautogui.screenshot()
        enviroment = cv2.cvtColor(np.array(enviroment), cv2.COLOR_RGB2BGR)
        #enviroment = cv2.cvtColor(enviroment, cv2.COLOR_BGR2GRAY)
        enviroment = cv2.Canny(enviroment, 50, 200)
        enviroment_height, enviromente_width = enviroment.shape[:2]
        return pl
    '''

    def locate_on_screen(self,template_png,confidence,x_extension=0,y_extension=0):
        pl = None

        template_url = IMGTemplates + template_png

        template = cv2.imread(template_url)
        template_height, template_width = template.shape[:2]

        enviroment = pyautogui.screenshot()
        enviroment = cv2.cvtColor(np.array(enviroment), cv2.COLOR_RGB2BGR)
        enviroment_height, enviromente_width = enviroment.shape[:2]

        ncsearch = pyautogui.locateCenterOnScreen(template_url, confidence = confidence)
        x_center,y_center = ncsearch

        x_sup_left_corner = (x_center // 2)
        y_sup_left_corner = (y_center // 2)

        crop_img = enviroment[y_sup_left_corner:y_sup_left_corner+y_extension, x_sup_left_corner:x_sup_left_corner+x_extension]
        pl = Plane(crop_img,x_center,y_center)
        
        # Slicing

        cv2.imshow("cropped", crop_img)
        cv2.waitKey(0)
        return pl


    '''
    def multi_scale_locator(self, template_url,threshold):

        #original = cv2.imread(enviroment_url)

        template = cv2.imread(template_url)
        template = cv2.cvtColor(template, cv2.COLOR_BGR2GRAY)
        template = cv2.Canny(template, 50, 200)
        template_height, template_width = template.shape[:2]

        #enviroment = cv2.imread(enviroment_url)
        enviroment = pyautogui.screenshot()
        enviroment = cv2.cvtColor(np.array(enviroment), cv2.COLOR_RGB2BGR)
        #enviroment = cv2.cvtColor(enviroment, cv2.COLOR_BGR2GRAY)
        enviroment = cv2.Canny(enviroment, 50, 200)
        enviroment_height, enviromente_width = enviroment.shape[:2]

        rectangles = []
        #threshold = 0.40
        
        #for scale in np.linspace(0.2, 1.0, 20)[::-1]:

        # Redimension de la imagen con base a la escala actual.
        resized = imutils.resize(template, width=int(template.shape[1]))
        w, h = resized.shape[:2]

        #result = cv2.matchTemplate(enviroment,resized, cv2.TM_CCOEFF_NORMED)

        result = cv2.matchTemplate(enviroment,resized, cv2.TM_CCOEFF_NORMED)
        #min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(result)

        yloc, xloc = np.where(result >= threshold)
        for (x, y) in zip(xloc, yloc):
            rectangles.append([int(x), int(y), int(h), int(w)])
            rectangles.append([int(x), int(y), int(h), int(w)])

        print("loc: ", len(xloc))
        if(len(xloc) > 1 or len(xloc) == 0):
            sys.exit()
            
        rectangles, weights = cv2.groupRectangles(rectangles, 1, 0.9)
        
        return rectangles

    def locate(self, image):
            img = cv2.imread(image)
            dimensions = img.shape
            print(dimensions)
            try:
                self.x, self.y = pyautogui.locateCenterOnScreen(image,confidence=0.90)
                print("x: ", self.x, "y: ", self.y)
            except:
                print("Image not found")
            return self.x, self.y, dimensions[1], dimensions[0]
    
    '''