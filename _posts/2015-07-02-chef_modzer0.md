---
title: Chef of ModZer0
layout: default
---

# Chef of ModZer0

## the steps
- Spin up a new CentOS 7.1 system with a chef user setup with sudo
- bootstrap the system into n1nj4net chef organization
- customize the system to become modzer0 with user/keys/sudo setup nicely
- make a minecraft server and new world
- profit

Steadman provisioned the system and got C7 with chef user installed.  The next steps were:

```
knife bootstrap modzer0.n1nj4.net --ssh-us-ssh-userr chef --sudo --run-list 'recipe[d-base::default]'
```
