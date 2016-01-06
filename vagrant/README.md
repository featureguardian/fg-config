## Why Vagrant?
In two commands new developers can have a machine provisioned that runs the application in a consistent way.  It also allows a developers host machine (i.e OS X) to be configured in a way different from one or more applications being run on his machine.

You can read more here: https://docs.vagrantup.com

## Vagrant Setup

The Vagrant config is setup to map port 1337 from the guest (ubuntu 14.04 LTS) to the host (your machine) so that the application is accessible at http://localhost:1337 when it is running on the guest OS, which is headless.

You must install two programs which will automatically provision a development environment suitable for running and developing all Feature Guardian modules.

#### Install the following:

1. [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](https://www.vagrantup.com/downloads.html)
3. Clone this (fg-config) repository into a project folder you will use for feature guardian

#### Run Vagrant
Note: The default config assumes you are running vagrant from inside a projects folder containing this repository, if that is not the case you must edit or comment out this line first in the file `Vagrantfile`:

```
config.vm.synced_folder "../../", "/vagrant/projects"
```

This allows you to work on the host system and have all file changes automatically synced to the guest VM.

**Note to Windows Users:** Your shell must support ssh (i.e. git bash) and be started in admin mode for symbolic links to work correctly.  This is required for you to execute npm on the guest OS.

Then to provision and start, run:

```
vagrant up
```

This will run an Ubuntu 14.04 LTS VM configured with 1GB RAM.  It installs the following for you:

1. Node.JS version 4.2.x, and updates to the latest version of NPM
2. Installs MongoDB version 3.2.x
3. Installs Git and Git Flow
4. Installs global npm modules:
    * Gulp
5. Git clones Feature Guardion repositories into `/projects` and runs `npm install` for each
    * fg-service
    * fg-admin-ui

Once it starts you can execute `vagrant ssh` to gain access to the machine.

`vagrant up` will automatically provision the machine (run setup.sh) the first time,  but you may manually invoke the script at a later time by running `vagrant provision`  as it is written to be idempotent.

Run `vagrant` by itself to see a listing of all available commands.

