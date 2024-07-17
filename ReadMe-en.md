# What kind of project is this?

This project aims to provide a framework for calling shell scripts, featuring a simple text-based UI. By following the prompts and entering commands, you can quickly invoke corresponding scripts.

# How do I use it?

Firstly, understand that this project only requires the following files and directory structure:

- ui.sh
- lib/
    - color.sh
    - const.sh
- personal-scripts/

That's all you need.

## What you need to do

1. Under the `personal-scripts` directory, write your desired script files based on the template file `thisIsAScriptFile.sh`. Save these scripts within the `personal-scripts` directory. The main script `ui.sh` will call each script in this directory individually, passing the `-d` parameter to generate a list of scripts, which will be displayed through a text-based UI.
2. Run `ui.sh`. It will work regardless of whether you are currently in the same directory as `ui.sh` or if you execute a symbolic link pointing to `ui.sh`.