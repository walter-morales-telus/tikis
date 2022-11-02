from DocHandlerFile import DocHandler

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
        print(ncobject)





