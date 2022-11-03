class LogMicroTask:

    def __init__(self):
        self.name             = ""
        self.template         = ""
        self.description      = ""
        self.exeption         = ""
        self.success          = False
    
    def __init__(self,name,template,description,exeption,success):
        self.name             = name
        self.template         = template
        self.description      = description
        self.exeption         = exeption
        self.success          = success

class LogStepper:

    def __init__(self):
        self.name             = ""
        self.micro_tasks_list = []
    
    def __init__(self,name,micro_tasks_list):
        self.name             = name
        self.micro_tasks_list = micro_tasks_list

class Log:
    
    def __init__(self):
        self.correlative      = ""
        self.object_id        = ""
        self.sequence_name    = ""
        self.Stepper_list     = []

class Recorder:

    stLog          = Log()
    stLogStepper   = LogStepper()
    stLogMicroTask = LogMicroTask()

    def __init__(self):
        pass