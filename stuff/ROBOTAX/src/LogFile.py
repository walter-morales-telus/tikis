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

class Recorder:

    stLog          = Log()
    stLogStepper   = LogStepper()
    stLogMicroTask = LogMicroTask()

    def __init__(self):
        pass

    def add_new_task_to_step(self,task_name,micro_task:LogMicroTask):
        self.stLogMicroTask.name = task_name

        template = Recorder.stLogMicroTask.template
        Recorder.stLogMicroTask.name = "Click to " + template
        lmtask = copy.copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lmtask)

        pass

    def updateTask(self,name="",template="",description="",exeption="",success=None):
        if name != "":
            self.stLogMicroTask = name
        
        if template != "":
            self.stLogMicroTask = template

        if description != "":
            self.stLogMicroTask = exeption
        
        if success != None:
            self.stLogMicroTask = success


    def updateSequence():
        pass