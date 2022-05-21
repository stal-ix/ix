import sys

import xml.etree.ElementTree as ET

el = None

for a in sys.argv[1:]:
    n = ET.parse(a).getroot()

    if el:
        el.extend(n)
    else:
        el = n

sys.stdout.write(ET.tostring(el, encoding='unicode'))
