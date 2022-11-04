import copy


class LogMicroTask:
    
    def __init__(self,name="",template="",description="",exeption="",success=None):
        self.name             = name
        self.template         = template
        self.description      = description
        self.exeption         = exeption
        self.success          = success

class LogStepper:

    def __init__(self,name = "", micro_tasks_list = []):
        self.name             = name
        self.micro_tasks_list = micro_tasks_list

class Log:
    
    def __init__(self):
        self.correlative      = ""
        self.object_id        = ""
        self.sequence_name    = ""
        self.Stepper_list     = []

class Fallen:

    def __init__(self,allowed_miss,template=None):
        self.allowed_miss = allowed_miss
        self.template     = template
        if allowed_miss == template:
            self.do_the_names_match = True
        else:
            self.do_the_names_match = False
        self.validation_result = None


class Recorder:

    stLog          = Log()
    stLogStepper   = LogStepper()
    stLogMicroTask = LogMicroTask()

    def __init__(self):
        pass

    def add_new_task_to_step():
        lg_mtask = copy.copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lg_mtask)

    def add_new_step_to_sequence():
        lg_stp = copy.deepcopy(Recorder.stLogStepper)
        Recorder.stLog.Stepper_list.append(lg_stp)
    
    def validate_sequence(allowed_miss=""):

        if(allowed_miss != ""):
            tmp = allowed_miss.split("/")
            allowed_miss = tmp[len(tmp) - 1]

        #Fl:Fallen = Fallen(allowed_miss)
        Fl:Fallen = None
        for task in Recorder.stLogStepper.micro_tasks_list:
            Fl = Fallen(allowed_miss,task.template)
            if(task.success != True and not Fl.do_the_names_match):
                print("")
                print("*** F A I L ***\n")
                print(task.name)
                print(task.template)
                print(task.description)
                Fl.validation_result = False    
                return Fl    
            elif Fl.do_the_names_match:
                Fl.validation_result = False 
            else:
                Fl.validation_result = True  
        return Fl  
        
            
    
    def reset_recorder():
        Recorder.stLog          = Log()
        Recorder.stLogStepper   = LogStepper()
        Recorder.stLogMicroTask = LogMicroTask()
    