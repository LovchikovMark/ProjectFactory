import typer
import json
from factory import Factory

try:

    with open('test.json', 'r') as f:

        data = json.loads(f.read())

        Factory(data)

except FileNotFoundError:

    print('file not found')
    