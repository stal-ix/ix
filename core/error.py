class Error(Exception):
    def __init__(self, s, exception=None):
        Exception.__init__(self, s)
        self.exception = exception
