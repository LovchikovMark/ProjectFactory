import yaml
import typer
from factory import Factory
import os
from pathlib import Path

app = typer.Typer()

@app.command(help="Create file stucture")
def cfs(sample_file_path : str = typer.Option(False, '-f', help="Sample file path"), directory : str = typer.Argument(default=os.getcwd, help="target directory")):

    current_dir = Path.cwd()
    yaml_path = (current_dir / sample_file_path).resolve()

    try:

        with open(yaml_path, 'r') as f:

            data = yaml.safe_load(f)

            Factory(data, path=str((current_dir / directory).resolve()))


    except FileNotFoundError:

        print('file not found')
    

@app.command()
def goodbye(name : str = typer.Argument(..., help="Enter your name: ")):

    typer.echo(name)

app()