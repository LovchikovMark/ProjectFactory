import shutil
from pathlib import Path
import os

def Factory(data, path = "~"):

    if "folders" in data and data['folders']:

        for folder_name in list(data['folders'].keys()):

            os.mkdir(path + "/" + folder_name)
                    
            if 'files' in data['folders'][folder_name] and data["folders"][folder_name]['files']:

                for file_name in data["folders"][folder_name]['files']:

                    Path(path + "/" + folder_name + "/" + file_name).touch()


            if type(data['folders'][folder_name]) == str:

                shutil.copytree(path + '/' + data['folders'][folder_name], path + "/" + folder_name, dirs_exist_ok=True)
            
            else:

                Factory(data['folders'][folder_name], path + "/" + folder_name)