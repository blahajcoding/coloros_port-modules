# OxygenOS/ColorOS Porting Project - Modules
This project aims to reduce the size of the ColorOS porting script, by moving the larger modules into this seperate repository. This allows the script to be easily adapt to your needs. Think of it like browser extensions: they can easily modify or add features to a webpage with their use of JavaScript. But instead of the tedious usage of Javascript and JSON files, this instead uses ZIP files and Markdown files.

## How do I use this?
Your module folder should look like this:
```bash
coloros_port-modules
└── ExampleModule
    ├── files.zip
    ├── module.md
    └── script.sh
```
Any files that aren't in `files.zip` will be ignored. `module.md` simply explains what the module is, and so it should look like this:
```markdown
# Example module
Created by Juniper and Blahaj

## Description
A module that sets the market name to turn your device into an iPhone 17 Pro Max

## Changelogs
### 12/02/26
- Module no longer wipes system
```
`script.sh` will be what happens to files in files.zip. For example:
```bash
# !/bin/bash
blue "Modifying market name"
sed -i "s/ro.vendor.oplus.market.name=.*/ro.vendor.oplus.market.name=iPhone 16 Pro Max/g" build/portrom/images/my_manifest/build.prop
blue "Adding files for the full transformation"
cp -rf $module_files/* build/portrom/images/my_product
```
`$module_files` will be the contents of `files.zip`. 

This whole thing isn't complicated, thanks to the magic power of the `source` command! All functions and variable from the port script, can still be utilised in `script.sh`. If you want to integrate it into your script, create a file in `device/Your devices/modules` (e.g `devices/OnePlus9Pro/modules`) or `devices/common/modules`. This file shall be a script, named as your module name. The file should look something like this:
```bash
# !/bin/bash
module_name=ExampleModule
module_repo=https://github.com/blahajcoding/coloros_port-modules
module_repo_branch=main
```
All variables in this file are also to be imported into the main script, and should automatically get picked up by the script.