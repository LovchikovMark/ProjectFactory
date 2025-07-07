import * as fs from 'fs'
import * as yaml from 'js-yaml'
import * as path from "path"
import { types } from 'util';

async function main()
{
    try
    {
        const templatePath = process.argv[3];
        const absolutePath = path.isAbsolute(templatePath) ? templatePath : path.resolve(process.cwd(), templatePath);
        const directoryPath = process.argv[5] ? process.argv[5] : process.cwd()
        const content = yaml.load(fs.readFileSync(absolutePath, 'utf-8'));

        fs.writeFileSync(path.join(process.env.HOME as string, '/MyProjects/ProjectFactory/src/logs/parsedTemplate.txt'), JSON.stringify(content));
        executeTemplate(content, directoryPath);
    }
    catch(e)
    {
        throw new Error(`${e}`)
    }
}

async function executeTemplate(tree : any, startDir : string)
{
    for (const [key, value] of Object.entries(tree)) {
        if(key == "root")
        {
            for(let file in tree[key])
                await fs.promises.writeFile(startDir + "/" + tree[key][file], "")
            continue
        }
        const fullPath = path.join(startDir, key);

        await fs.promises.mkdir(fullPath, { recursive: true });

        if (typeof value === 'object') 
        {
            if (Array.isArray(value)) {
                for (const fileName of value) {
                    const filePath = path.join(fullPath, fileName);
                    await fs.promises.writeFile(filePath, '');
                }
            } else {
                await executeTemplate(value, fullPath);
            }
        }
        else if (typeof value === 'string')
        {

        }
        else
        {
          console.error("Unexpected value type:", typeof value, value);
        }
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

main()