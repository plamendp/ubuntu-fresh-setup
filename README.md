# Initial setup of a Freshly installed Ubuntu Desktop

A very simple script to install and setup the usual stuff you are doing every time you install a brand new Ubuntu Desktop! 


At least this is my usual stuff :-) 

## Quick start 

Just run the shell script

    ./setup.sh

## Rerunning

When the script is executed, it creates a lock file in /tmp directory. On next run, if that file is found, execution is stopped to prevent unwanted system changes.

	/tmp/ubuntu-fresh-setup.lock
    
## Customizing

If you want to customize the setup, e.g. installing different package versions, copy the script, edit and run. There are various variables defined at the top of the file. Read the comments and apply changes as you wish.


 
