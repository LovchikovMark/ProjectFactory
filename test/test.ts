import * as fs from 'fs';
import * as os from 'os';
import path from 'path';
import * as yaml from 'js-yaml';

const content = yaml.load(fs.readFileSync(os.homedir() + '/MyProjects/ProjectFactory/templates/python.yaml', 'utf-8'));


export function getAllFiles(tree: Record<string, any>): string[] {
    let leaves: string[] = [];

    for (const node in tree) {
        if (Array.isArray(tree[node])) { // Проверяем на массив независимо от ключа
            leaves.push(...tree[node].map(item => item));
        } else if (typeof tree[node] === 'object') {
            leaves.push(...getAllFiles(tree[node])); // Рекурсивный вызов
        }
    }
    return leaves;
}