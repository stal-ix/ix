import sys
sys.dont_write_bytecode = True

import traceback
sys.excepthook = traceback.print_exception

import os
os.environ['SSL_CERT_FILE'] = 'nowhere'

try:
    import ssl
    ssl._create_default_https_context = ssl._create_unverified_context
except ImportError:
    pass

try:
    # we always download with checksums
    # and can not assume proper cert availability in bootstrap context
    # so we safely disable cert validation
    import urllib3
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
except ImportError:
    pass

import fcntl
fcntl.fcntl(1, fcntl.F_SETFL, 0)

import core.main as cm

def entry(me):
    sys.exit(cm.main(sys.argv, me))
