import * as fs from 'fs'
import * as os from 'os'
import path from 'path'
import * as yaml from 'js-yaml'

const content = yaml.load(fs.readFileSync(os.homedir() + '/MyProjects/ProjectFactory/templates/python.yaml', 'utf-8'));
console.log(content)