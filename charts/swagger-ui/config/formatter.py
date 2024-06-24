import argparse
import json
import re

import yaml


def load_openapi(filepath):
    with open(filepath, 'r') as file:
        if filepath.endswith('.yaml') or filepath.endswith('.yml'):
            return yaml.safe_load(file)
        elif filepath.endswith('.json'):
            return json.load(file)
        else:
            raise ValueError("Unsupported file format. Use .json or .yaml/.yml.")

def load_config(config_filepath):
    with open(config_filepath, 'r') as file:
        return yaml.safe_load(file)

def save_openapi(data, filepath):
    with open(filepath, 'w') as file:
        if filepath.endswith('.yaml') or filepath.endswith('.yml'):
            yaml.dump(data, file, sort_keys=False)
        elif filepath.endswith('.json'):
            json.dump(data, file, indent=2)
        else:
            raise ValueError("Unsupported file format. Use .json or .yaml/.yml.")

def filter_paths(openapi_data, whitelist):
    paths = openapi_data.get('paths', {})
    filtered_paths = {}
    for path, methods in paths.items():
        if path in whitelist:
            filtered_methods = {method: data for method, data in methods.items() if method in whitelist[path]}
            if filtered_methods:
                filtered_paths[path] = filtered_methods
    openapi_data['paths'] = filtered_paths
    return openapi_data

def rewrite_paths(openapi_data, rewrite_from, rewrite_to):
    paths = openapi_data.get('paths', {})
    rewritten_paths = {}
    for path, methods in paths.items():
        new_path = re.sub(rewrite_from, rewrite_to, path)
        rewritten_paths[new_path] = methods
    openapi_data['paths'] = rewritten_paths
    return openapi_data


def main():
    parser = argparse.ArgumentParser(description='Filter OpenAPI endpoints based on a whitelist.')
    parser.add_argument('input', help='Path to the input OpenAPI file (JSON or YAML)')
    parser.add_argument('output', help='Path to the output filtered OpenAPI file (JSON or YAML)')
    parser.add_argument('config', help='Path to the file with config definition')

    args = parser.parse_args()
    
    # Load OpenAPI document
    openapi_data = load_openapi(args.input)

    # Load configuration
    config = load_config(args.config)
    
    #  Check if whitelist is defined and apply if applicable
    whitelist = config.get('api', {}).get('whitelist', None)
    if not whitelist:
        filtered_openapi_data = openapi_data
    else:
        filtered_openapi_data = filter_paths(openapi_data, whitelist)

    # Check if rewrite rules are defined and apply them if applicable
    rewrite_rules = config.get('api', {}).get('rewrite', None)
    if rewrite_rules:
        rewrite_from = rewrite_rules.get('from', '')
        rewrite_to = rewrite_rules.get('to', '')
        filtered_openapi_data = rewrite_paths(filtered_openapi_data, rewrite_from, rewrite_to)

    server_url = config.get('server', {}).get('url', None)
    if server_url:
        filtered_openapi_data['servers'] = [{'url': server_url}]
                    
    save_openapi(filtered_openapi_data, args.output)
    print(f"Filtered OpenAPI document saved to {args.output}")

if __name__ == '__main__':
    main()
