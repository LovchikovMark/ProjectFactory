[![Version](https://img.shields.io/badge/version-1.0.1-blue.svg)](https://github.com/LovchikovMark/ProjectFactory/releases)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.12+-blue.svg)](https://www.python.org/)

# Welcome to ProjectFactory!

Tired of manually creating the same project structure over and over? ProjectFactory solves that! With templates for NestJS, NextJS, ASP.NET, and other popular frameworks, you can generate complete project setups in seconds.

Whether you're starting a small project or building a complex application, ProjectFactory automates directory creation so you can focus on writing code.

Try it out and boost your productivity!

-----------------

## Installation

### Manual

```
curl -L -o /usr/local/bin/pf https://github.com/LovchikovMark/ProjectFactory/releases/latest/download/pf

sudo chmod +x /usr/local/bin/pf

mkdir ~/.config/pf
```

## Tutorial:

To start using PF, create a .json config file. Its structure:

```
{
    "src": {
        "database": {},
        "files": ["main.py"]
    },
    "test": {
        "files": ["test.py"]
    },
    "files": [".gitignore", "README.md", "req.txt", "AUTHORS.md", ".env"]
}
```

Then, you can create a file structure by 'cfs' command:

```
pf cfs -f <path_to_your_config_file> <target_directory>
```

- Example:
    ```
    pf cfs -f python-project.json home
    ```

If you want safe your config, use the 'smt' command:

```
pf smt -f <path_to_your_config_file>
```

- Example:
    ```
    pf smt -f python-project.json
    ```

Now, you can use it to create file structure everywhere:

```
pf cfs -t <your_config_file_name>
```

- Example:
    ```
    pf cfs -t python-project
    ```

If you want to see all your templates:

```
pf gmt
```

Or manually:

```
ls ~/.config/pf
```

Enjoy! :)