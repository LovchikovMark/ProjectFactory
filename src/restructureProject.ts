import * as fs from 'fs/promises'
import * as yaml from 'js-yaml'
import * as path from "path"
import { getCurrentTemplate } from './getCurrentTemplate';

async function main()
{
    try
    {
        const newTemplatePath = process.argv[3];
        const absolutePath = path.isAbsolute(newTemplatePath) ? newTemplatePath : path.resolve(process.cwd(), newTemplatePath);
        const directoryPath = process.argv[5] ? process.argv[5] : process.cwd()
        const newTemplateContent = await yaml.load(await fs.readFile(absolutePath, 'utf-8'));

        if(compareOldAndNewTemplate(await getCurrentTemplate(process.cwd()), await yaml.load(newTemplateContent as string)))
        {
            restructureProject(await getCurrentTemplate(process.cwd()), newTemplateContent)
        }
        else
        {
            console.log("Templates not coincide! All files from old template should be in new template, please, check it")
        }
    }
    catch(e)
    {
        throw new Error(`${e}`)
    }
}

function compareOldAndNewTemplate(oldTemplate : any, newTemplate : any) : boolean
{
    return getAllFiles(newTemplate).every(item => getAllFiles(oldTemplate).includes(item))
}

function getAllFiles(tree : any) : any[]
{
    let leaves = []
    for(const [key, value] of Object.entries(tree))
    {
        if(typeof(value) == 'object')
            leaves.push(getAllFiles(value))
        else if(Array.isArray(value))
            leaves.push(value)
    }
    return leaves.flat()
}

function restructureProject(oldTemplate : any, newTemplate : any, currentDir = process.cwd())
{
    console.log(oldTemplate)
    const oldPaths : Record<string, string> = {}
    for(const [key, value] of Object.entries(oldTemplate))
    {
        const fullPath = path.join(currentDir, key);
        if(value == 'root' && typeof(value) == 'object')
        {
            for(let item in value)
            {
                oldPaths[item] == fullPath + `/${item}`
            }
        }
        else if(value != 'root' && typeof(value) == 'object')
            restructureProject(value, "", fullPath)
    }
}

main()