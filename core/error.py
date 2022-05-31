class Error(Exception):
    def __init__(self, s, context=None, exception=None, visible=True):
        Exception.__init__(self, s)
        self.context = context
        self.exception = exception
        self.visible = visible
