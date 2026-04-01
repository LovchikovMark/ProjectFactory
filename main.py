import yaml
import typer
from factory import Factory
import os
from pathlib import Path

app = typer.Typer()

@app.command(help="Create file stucture")
def cfs(sample_file_path : str = typer.Option(None, '-f', help="Sample file path"), my_template_name : str = typer.Option(None, '-t', help="Sample file path"),directory : str = typer.Argument(default=os.getcwd, help="target directory")):
    
    print(sample_file_path)
    print(my_template_name)

    if sample_file_path:

        current_dir = Path.cwd()
        json_path = (current_dir / sample_file_path).resolve()

        try:

            with open(json_path, 'r') as f:

                data = yaml.safe_load(f)

                Factory(data, path=str((current_dir / directory).resolve()))


        except FileNotFoundError:

            print('file not found')

    elif my_template_name:

        current_dir = Path.cwd()
        json_path = (Path.home() / ".config" / 'pf' / (my_template_name + ".json")).resolve()

        try:

            with open(json_path, 'r') as f:

                data = yaml.safe_load(f)

                Factory(data, path=str((current_dir / directory).resolve()))


        except FileNotFoundError:

            print('file not found')

@app.command(help="Save your template for future using")
def smt(sample_file_path : str = typer.Option(False, '-f', help="Sample file path")):

    current_dir = Path.cwd()
    json_path = (current_dir / sample_file_path).resolve()

    try:

        Path.copy_into(json_path, f"{Path.home()}/.config/pf")

    except FileNotFoundError:

        print('file not found')

@app.command(help="Save your template for future using")
def gmt():

    try:

        for file in os.listdir(f"{Path.home()}/.config/pf"):

            print(file.split('.json')[0])

    except FileNotFoundError:

        print('file not found')


app()