import yaml
from factory import Factory

try:

    with open('test.yaml', 'r') as f:

        data = yaml.safe_load(f)

        Factory(data)

        #print(list(filter(lambda i: isinstance(data[i], dict), list(data.keys()))))


except FileNotFoundError:

    print('file not found')
    