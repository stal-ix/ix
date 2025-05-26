class Error(Exception):
    def __init__(self, s, exception=None, visible=True):
        Exception.__init__(self, s)
        self.exception = exception
        self.visible = visible
