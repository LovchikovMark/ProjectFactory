# Welcome to ProjectFactory!

Tired of manually creating the same project structure over and over? ProjectFactory solves that! With templates for NestJS, NextJS, ASP.NET, and other popular frameworks, you can generate complete project setups in seconds.

Whether you're starting a small project or building a complex application, ProjectFactory automates directory creation so you can focus on writing code.

Try it out and boost your productivity!

-----------------


Tutorial:

For start using PF, create a .json file. It's structure:

```
{
    "folders": {

        "Controllers": {

            "files": ['main.controller.js']

        },

        "Models": {
            "files": ['main.module.js']
        },

        "Views": {
            "files": ['main.view.js']
        }
    }
}
```


"folders" block containes only folders, "files" contains only files.

If you're wanna copy all from one folder to another, just write like this:

```
{
    "folders": {
        
        "f1": {
            
            "files": ["file.txt"]

        },

        "f2": "f1"

    }
}

```

So all from f1 will be copy to f2