import win32gui
import win32api
import time

class Draw:
    
    def __init__(self):
        self.red    = win32api.RGB(255, 0, 0)
        self.green  = win32api.RGB(0, 255, 0)
        self.blue   = win32api.RGB(0, 0, 255)
        self.black  = win32api.RGB(0, 0, 0)
        self.white  = win32api.RGB(255, 255, 255)
        self.yellow = win32api.RGB(255, 255, 0)
        self.purple = win32api.RGB(255, 0, 255)
        self.cyan   = win32api.RGB(0, 255, 255)

    def draw_small_x(self,x, y,color):
        dc = win32gui.GetDC(0)

        for i in range(10):
            win32gui.SetPixel(dc, x + i, y + i, color)
        x += 10

        for j in range(10):
            win32gui.SetPixel(dc, x - j, y + j, color)

    def draw_rectangles(self,rectangles):
        for (x,y,w,h) in rectangles:
            self.draw_frame_by_sup_left_corner(x,y,w,h,self.red)
            #cv2.rectangle(original, (x,y), (x+w, y+h), (0,255,255), 2)


    def draw_frame_by_sup_left_corner(self,x, y, width, height,color):
        dc = win32gui.GetDC(0)

        win32gui.SetPixel(dc, x, y, color)  # draw red at 0,0
        thickness = 3
        for i in range(x, x + width):

            for j in range(thickness):
                win32gui.SetPixel(dc, i, y + j, color)
                win32gui.SetPixel(dc, i, y + height - j, color)

        for i in range(y, y + height):

            for j in range(thickness):
                win32gui.SetPixel(dc, x + j, i, color)
                win32gui.SetPixel(dc, x + width - j, i, color)
    
    def draw_frame_by_center(self,x, y, width, height,color):
        self.draw_frame_by_sup_left_corner((x - (width // 2)),(y - (height // 2)),width,height,color)

