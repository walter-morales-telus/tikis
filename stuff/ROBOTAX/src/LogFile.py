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

    def add_new_task_to_step():
        lg_mtask = copy.copy(Recorder.stLogMicroTask)
        Recorder.stLogStepper.micro_tasks_list.append(lg_mtask)

    def add_new_step_to_sequence():
        lg_stp = copy.deepcopy(Recorder.stLogStepper)
        Recorder.stLog.Stepper_list.append(lg_stp)
        sksk = 0
    
    def reset_recorder():
        Recorder.stLog          = Log()
        Recorder.stLogStepper   = LogStepper()
        Recorder.stLogMicroTask = LogMicroTask()
    