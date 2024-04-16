import os
import re
import sys
import xml.dom.minidom

if len(sys.argv)<3:
    print("Not enough parameters")
    sys.exit(-1)

with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as fh:
    print("| File          | Coverage |                    |", file=fh)
    print("|---------------|:--------:|:------------------:|", file=fh)

    min_perc = int(sys.argv[2])

    with open(sys.argv[1], "r") as f:
        xml_doc = xml.dom.minidom.parse(f)
        perc_total = int(round(float(xml_doc.documentElement.getAttribute('line-rate'))*1000))
        sign_total = ":white_check_mark:" if (perc_total>=(min_perc*10)) else ":x:"
        print(f"|  **All files**  | `{perc_total/10}%`    |  {sign_total} |", file=fh)

        for cl in xml_doc.getElementsByTagName('class'):
            perc = int(round(float(cl.getAttribute('line-rate'))*1000))
            sign = ":white_check_mark:" if (perc>=(min_perc*10)) else ":x:"
            escape_chars = r'_*[]()~`>#+-=|{}.!'
            text =  re.sub(f'([{re.escape(escape_chars)}])', r'\\\1', cl.getAttribute('filename'))
            print(f"| {text}   | `{perc/10}%`    |  {sign} |", file=fh)
        
        print("", file=fh)
        if (perc_total<min_perc):
            print("**Minimum coverage requirement was not satisfied**", file=fh)
            sys.exit(-1)
