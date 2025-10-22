# Github Actions Status
![Assignment-1 Build Status](https://github.com/cu-ecen-aeld/assignment-1-arashizadi-1/actions/workflows/github-actions.yml/badge.svg)

***

# Student's Note
Hi there, welcome to my fork of ecen-5305. I'm going to document what I have done here to help peer reviewers understand the changes that I have introduced as part of assignments and initial setup.

## My Setup
- My primary system is a Windows 11 machine. For coding in Linux environment, I wired up a Raspberry Pi 5 to my LAN and I SSH into it. I use VSCode as my main IDE and it's easy to run remote projects from my Pi on Windows. TLDR all the source code that I commit is coming from my Pi.
- For GitHub Action Runner, I Use Debian via WSL running on my Windows 11 machine.

## Things I changed generally outside of homework
- ### Modified README.md
This is an obvious one, This text is here because I modified the contents of README.md. Furthermore, I added a github action build badge to showcase the latest state of build.

- ### Jetify Devbox Support
[Devbox](https://www.jetify.com/devbox) creates an ephemeral shell locally which helps to bootstrap the environment specific to project. The benefit of this is that since I have other projects running on my Pi, each installed package only works within the same Devbox shell instance, making my Pi bloat-free. Furthermore I'm able to install specific versions of each package compatible with project requirements. For this project, I specified to install the latest ruby version and cmake v3.31 which is the latest compatible version avaialble in nix store (where Devbox installs package from). To see the configurations, checkout [devbox.json](https://github.com/cu-ecen-aeld/assignment-1-arashizadi-1/blob/main/devbox.json). In practice, whenever I run `devbox shell`, it would install those packages if they're not already in cache and as soon as I exit the shell, it would unlink those packages, making them unavailable on my primary shell.

- ### Note on using arm64 arch, instead of x64 locally
Things are working so far. The good thing is that my custom runner is x64 so in practice, I test my code in both arm64 and x64.

*END OF STUDENT'S NOTE*

***

# aesd-assignments
This repo contains public starter source code, scripts, and documentation for Advanced Embedded Software Development (ECEN-5713) and Advanced Embedded Linux Development assignments University of Colorado, Boulder.

## Setting Up Git

Use the instructions at [Setup Git](https://help.github.com/en/articles/set-up-git) to perform initial git setup steps. For AESD you will want to perform these steps inside your Linux host virtual or physical machine, since this is where you will be doing your development work.

## Setting up SSH keys

See instructions in [Setting-up-SSH-Access-To-your-Repo](https://github.com/cu-ecen-aeld/aesd-assignments/wiki/Setting-up-SSH-Access-To-your-Repo) for details.

## Specific Assignment Instructions

Some assignments require further setup to pull in example code or make other changes to your repository before starting.  In this case, see the github classroom assignment start instructions linked from the assignment document for details about how to use this repository.

## Testing

The basis of the automated test implementation for this repository comes from [https://github.com/cu-ecen-aeld/assignment-autotest/](https://github.com/cu-ecen-aeld/assignment-autotest/)

The assignment-autotest directory contains scripts useful for automated testing  Use
```
git submodule update --init --recursive
```
to synchronize after cloning and before starting each assignment, as discussed in the assignment instructions.

As a part of the assignment instructions, you will setup your assignment repo to perform automated testing using github actions.  See [this page](https://github.com/cu-ecen-aeld/aesd-assignments/wiki/Setting-up-Github-Actions) for details.

Note that the unit tests will fail on this repository, since assignments are not yet implemented.  That's your job :) 
