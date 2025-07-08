import * as fs from 'fs/promises'
import * as os from 'os'

export async function getCurrentTemplate(currentDirectory = process.cwd())
{
    let currentTemplate : Record<string, any> = {root: []}
    let items = await fs.readdir(currentDirectory)
    let gitignore
    try
    {
        gitignore = await fs.readFile(currentDirectory + "/.gitignore", {encoding: 'utf-8'})
    }
    catch(e)
    {

    }

    gitignore = gitignore?.replace('/', '').split('\n') + '\n.git'

    for(const element of items)
    {
        if(!gitignore?.includes(element))
        {
            let fullPath = currentDirectory + '/' + element
            try
            {
                const stat = await fs.stat(fullPath)
                if(stat.isDirectory())
                {
                    currentTemplate[element] = await getCurrentTemplate(fullPath)
                }
                else if(stat.isFile())
                {
                    currentTemplate.root.push(element)
                }
            }
            catch(e : any)
            {
                
            }
        }
    }
    return currentTemplate
}

(async () => console.log(await getCurrentTemplate()))()