import time
from turtle import width
from DrawFile import Draw
from LocatorFile import Locator

def main():

    time.sleep(5)
    Lc = Locator()
    Dw = Draw()
    rectangles = Lc.multi_scale_locator('./Img/Templates/chrome.png')
    Dw.draw_rectangles(rectangles)

if __name__ == "__main__":
    main()