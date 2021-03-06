#!/usr/bin/python3
from typing import Dict
extension_map = {
    'pdf': 'pdfs',
    'png': 'Pictures',
    'jpg': 'Pictures',
    'pgm': 'Pictures',
    'mp3': 'Audio',
    'txt': 'Documents'
}

extensions = extension_map.keys()

work_base = '/home/sam/Documents'
misc_base = '/home/sam'

course_regex :Dict[str,str]= {
    r'(.*[M|m]achine[^a-zA-Z]*[L|l]earning.*)|(^ML)': 'machine_learning',
    r'.*[N|n]eural[^a-zA-z]*[N|n]et[works|s]*.*' : 'neural_computation',
    r'.*[I|i]ntelligent[^a-zA-Z]*[R|r]obotics.*' : 'intelligent_robotics'
}

import os
import re
for file in os.listdir("/home/sam/Downloads"):
    file_ext = file.split('.')
    try:
        file_ext = file_ext[1]
        if extensions.__contains__(file_ext):
            for regex in course_regex:
                if re.findall(regex,file):
                    # print(f"RE_MATCH \n cp /home/sam/Downloads/{file} {work_base}/{course_regex[regex]}/{extension_map[file_ext]}")
                    os.system(
                        f'mkdir -p {work_base}/{course_regex[regex]}/{extension_map[file_ext]}')
                    os.system(f"mv /home/sam/Downloads/{file} {work_base}/{course_regex[regex]}/{extension_map[file_ext].lower()}/")
                else:
                    # print(f"NO HIT \n cp /home/sam/Downloads/{file} {misc_base}/{extension_map[file_ext]}/")
                    os.system(
                        f'mkdir -p {misc_base}/{extension_map[file_ext]}')
                    os.system(f"mv /home/sam/Downloads/{file} {misc_base}/{extension_map[file_ext]}/")
                    # pass
                    
    except IndexError:
        pass
