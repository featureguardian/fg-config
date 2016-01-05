## Vagrant Setup

You must install two programs which will automatically provision a development environment suitable for running and developing all Feature Guardian modules.

#### Install the following:

1. [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](https://www.vagrantup.com/downloads.html)

#### Run Vagrant
Note: The default config assumes you are running vagrant from inside a projects folder containing this repository, if that is not the case you must edit or comment out this line first in the file `Vagrantfile`:

```
config.vm.synced_folder "../../", "/projects"
```

This allows you to work on the host system and have all file changes automatically synced to the guest VM.

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
5. Clones Feature Guardion repositories into `/projects` and runs `npm install` for each

Once it starts you can execute `vagrant ssh` to gain access to the machine.

`vagrant up` will automatically provision the machine (run setup.sh) the first time,  but you may manually invoke the script at a later time by running `vagrant provision`  as it is written to be idempotent.

