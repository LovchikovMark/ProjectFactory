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

        if(compareOldAndNewTemplate(await getCurrentTemplate(directoryPath), newTemplateContent as Record<string, any>))
        {
            console.log('Project was successfully restructed!')
        }
        else
        {
            console.log('It looks like your new template (accrod we tried to restruct you directory) and you current project have different files')
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

function getAllFiles(tree: Record<string, any>): string[] {
    let leaves: string[] = [];

    for (const node in tree) {
        if (Array.isArray(tree[node])) {
            leaves.push(...tree[node].map(item => item));
        } else if (typeof tree[node] === 'object') {
            leaves.push(...getAllFiles(tree[node]));
        }
    }
    return leaves;
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