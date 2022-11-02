import time
#from turtle import width
#from DrawFile import Draw
#from LocatorFile import Locator
from DocHandlerFile import DocHandler
from SequencerFile import Sequencer

def main():

    #Lc = Locator()
    #Dw = Draw()
    #Dh = DocHandler()

    #Dh.convert_csv_to_json('./Docs/multitax.csv')
    #Dh.create_json_file('./Docs/offerings.json')
    #rectangles = Lc.multi_scale_locator('./Img/Templates/chrome.png')
    #Dw.draw_rectangles(rectangles)

    json_url = './Docs/offerings.json'
    Sq = Sequencer()
    Sq.start_automata(json_url)

if __name__ == "__main__":
    main()