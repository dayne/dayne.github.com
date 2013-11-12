---
title: .ssh/config
layout: default
---

One of the more powerful tools in your toolchest for rapidly bouncing between systems like a ninja is your *.ssh/config*

Your primary workstations (laptop and/or desktop) should have a carefully curated ssh_config file to optimize your daily operations.

## Global Options
```
Compression yes
VisualHostKey yes
GSSAPIAuthentication no
SendEnv GIT_*
Host host_alias_you_trust
  HostName full.name.of.the.host
  User username
  ForwardX11 yes
  ForwardX11Trusted yes
  ControlMaster auto
  ControlPath ~/.ssh/alias_of_host.sock
  ForwardAgent yes
Host next_host_alias_not_trusted_as_much
  HostName full.name.of.the.host
  User username 
```

Git identiy forwarding:

# making myself happy by setting this:
export GIT_AUTHOR_NAME="Dayne Broderson"
export GIT_AUTHOR_EMAIL=dayne@alaska.edu
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
# # and putting the following line in my .ssh/config_file 
# SendEnv GIT_*
# # top level global setting - remote sshd /etc/ssh/sshd_config
# # will need the following configuration tweak:
# AcceptEnv GIT_*
