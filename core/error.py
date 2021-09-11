class Error(Exception):
    def __init__(self, s, context=None, exception=None):
        Exception.__init__(self, s)
        self.context = context
        self.exception = exception
