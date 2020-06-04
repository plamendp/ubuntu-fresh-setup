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

## Additional resources

### Portainer and Dozzle control scripts

Simple scripts to start/stop/restart of the Portainer - a web based Docker management tool and Dozzle - Docker logs viewer.

    Portainer
    https://gist.github.com/plamendp/29d406240ddd89d85703c9924a249ae2
    
    Dozzle
    https://gist.github.com/plamendp/324d988ff2e0f8f1fa9f4fcf0437dd5f
    
You can find Portainer and Dozzle here:

    https://www.portainer.io/
    https://gist.github.com/plamendp/324d988ff2e0f8f1fa9f4fcf0437dd5f
 
