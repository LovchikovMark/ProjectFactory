# ProjectFactory

Wellcome to the ProjectFactory! An opensource project for accelerates your dev process, wrote on NodeJs ( TS/JS ) and Thor ( Ruby ).

## Wherefore?

Imagine you have three same projects, with equal stucture. ProjectFactory helps you create the file structure accord instructed template. Just one command and...Done! Instead of copypaste, you WriteOnce, and CreateEveryWhere))

## Tutorial

Firstly you have to load the installation script. For it:

git clone https://LovchikovMark/ProjectFactory/scripts/install.sh
After it:

chmod +x install.sh
Than:

sudo bash install.sh
### About install.sh

This script will install nodejs, ruby and some packages need for ProjectFactory, so it needs "sudo".  If you already have that packages, nothing will be installed.

> all requirements are described on requirements.txt

Also, this script will move all ProjectFactories' files on /usr/share, and will add the alias in your ~/.bashrc


### After install

Well done! You successfully installed the ProjectFacfory! If you will want to uninstall pf, so just write:

pf uninstall
And after removing, please, left the report on my repo🥹

### Templates

For start working, you must deside what template you're wanna use.  

Default, PF provide templates for projects on: python, js, ts, ruby, c#, c, c++.

So for use a custom template, write:

pf --template <path_to_your_template>
### How to write your own template?

PF works with .yaml ( .yml ) files, for describe your file structure. 

Example:

src:
  folder1: 
    - file1
  folder2: 
    - file2
  folder3: 
    - file3
core:
  folder1: 
    - file1
  folder2: 
    - file2
  folder3: 
    - file3

As you can see, that's easy😁

If you're wanna create files and subfolders, you must write like:


src:
  root:
    - file_on_root1
    - file_on_root2
  folder1: 
    - file1
  folder2: 
    - file2
  folder3: 
    root:
    - file_on_root1
    - file_on_root2
    subfolder4: 
      - another_file1
core:
  folder1: 
    - file1
  folder2: 
    - file2
  folder3: 
    - file3

### Directory

PF also has a "-d (--directory)" flag. As you understood right, it needs to look to directory, where your structure will be created. 

Use like:

pf --template <path_to_your_template> -d .
This command will create necessary structure on current directory, use it carefully🙂

## Conclusion

ProjectFactory is the powerfull tool if you often deal with same file structure. I hope it symplifies your life😇