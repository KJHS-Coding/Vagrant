# Virtual Machines and Vagrant

If you like Linux, and want to learn more about Linux operating systems,
then you should explore [Vagrant](http://en.wikipedia.org/wiki/Vagrant_(software)).
The [documentatation](http://docs.vagrantup.com/v2/) is hard at first, but complete.
Vagrant allows you to run virtual operating systems on your computer (the "host")
that you can _provision_ any way you see fit.  In modern web development,
environments get extremely complex.  Vagrant allows you to quickly and easily
set up development environments.  If you break something, or want to start over
fresh for any reason, it is a piece of cake. Ever wanted to know what happens
when you `rm -rf /*`, but were too afraid to try it in real life?  Try it in
a vagrantbox with no risk!

## Terminology
When running a [virtual machine](http://en.wikipedia.org/wiki/Virtual_machine)
your computer hardware and operating system are referred to as the 
[_host_](http://en.wikipedia.org/wiki/Host_machine) while the virtual operating
system is referred to as the _guest_.  To 
[provision](http://en.wikipedia.org/wiki/Provisioning#Server_provisioning) a server
or operating system is to install all of the necessary software and any other setup
required to do the necessary
[development](http://en.wikipedia.org/wiki/Software_development).
This is really the whole point of using a tool like vagrant.  The `Vagrantfile`s
specify the specifics of the guest which will run on your host machine.  Your
development environment then becomes entirely "disposable" and you can start over
fresh in very little time.  You can install only what you need and keep it separate
from other projects.

## Setup
To get started, you need to download/install 
[VirtualBox](https://www.virtualbox.org/wiki/Downloads) and
[Vagrant](http://www.vagrantup.com/downloads.html).  If you think you want to go
into web design, this is a very useful topic to explore.

#### Recommended Plugins
Vagrant has some plugins that make using the software even better.  You should
install [vagrant-pristine](https://github.com/fgrehm/vagrant-pristine) which is a very simple
plugin that combines the destroying and re-provisioning of a box in one command,
`vagrant pristine`.  The second plugin you should install is
[vagrant-cachier](https://github.com/fgrehm/vagrant-cachier).  This plugin saves data that
you download during 
[provisioning](http://en.wikipedia.org/wiki/Provisioning#Server_provisioning) for
use in subsequent `vagrant up`s.  Basically, this makes the process of starting over 
fresh _much faster_.  The third and final plugin that is recommended here is
[vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest).  "Guest Additions"
are software that get installed on the guest so that it will play nice with the host.
Since vagrant and virtualbox are two different pieces of software, they do not always
synchronize perfectly.  This plugin makes them cooperate automatically.

#### Host Resources
Running a virtual machine takes disk space.  You should keep track of how many
virtual boxes you are running (whether shut-down or not) and delete unused boxes.
You can always `vagrant up` again later.  The boxes in these demos take about 1-2 Gb
each.  Running virtual machines also takes cpu and memory resources from the host.
It is not recommended to run multiple virtual machines at the same time, unless you
have a whole lot of cpu and memory to spare.

## Using Vagrant and this Repo
To use this repository, simpy `cd` into one of the directories you are interested in
and execute `vagrant up`.  This will provision your box.  That is, run the virtual
operating system and any setup scripts that are included.  It is very worthwhile to
read through the install scripts to see how things are done.
