import shutil
from pathlib import Path
import os

def Factory(data, path = os.getcwd()):

    try:

        for folder_name in list(filter(lambda i: i != "files", list(data.keys()))):

            os.mkdir(path + "/" + folder_name)
                    
            if 'files' in data[folder_name] and data[folder_name]['files']:

                if isinstance(data[folder_name]['files'], list):

                    for file_name in data[folder_name]['files']:

                        Path(path + "/" + folder_name + "/" + file_name).touch()

                elif isinstance(data[folder_name]['files'], dict):

                    for file_name in list(data[folder_name]['files'].keys()):

                        Path(path + "/" + folder_name + "/" + file_name).touch()

                        with open(path + "/" + folder_name + "/" + file_name, 'w', encoding='utf-8') as f:

                            f.write(data[folder_name]['files'][file_name])



            if type(data[folder_name]) == str:

                shutil.copytree(path + '/' + data[folder_name], path + "/" + folder_name, dirs_exist_ok=True)
            
            else:

                Factory(data[folder_name], path + "/" + folder_name)
    
    except Exception as e:

        print(f'Error! {e}')
        