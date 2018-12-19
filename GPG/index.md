---
title: GPG keys
layout: default
---
## generate a new key:

[github article on generating a gpg
key](https://help.github.com/articles/generating-a-new-gpg-key/)

```
gpg --full-generate-key
```

* Enter: `(1) RSA and RSA (default)`
* Keysize: `4096`
* Valid for: `0` - does not expire
* Name: `Full Name Here`
* Email: `user@example.com`
* Comment: `https://yourwebsite.example.com/gpg-key-YYYY.key`

## list keys

`gpg --list-secret-keys --keyid-format LONG`

```
key_id=$(gpg --list-secret-keys --keyid-format LONG | grep sec \
         | sed 's/\// /g' | awk '{print $3}')
echo key_id=$key_id
gpg --armor --export $key_id > $key_id.gpg.pub
echo "exported key_id as GPG public key file: $key_id.gpg.pub"
git config --global user.signingkey $key_id
```

Add the key gpg.pub to your [GitHub account
settings](https://github.com/settings/keys)

Verify your keys (or some other users) with:

[https://api.github.com/users/USERNAME/gpg_keys](https://api.github.com/users/dayne/gpg_keys)

##

https://help.github.com/articles/telling-git-about-your-signing-key/

## curses gpg-agent
Making gpg-agent work well in command line only mode:
[su.com/520980](https://superuser.com/questions/520980/how-to-force-gpg-to-use-console-mode-pinentry-to-prompt-for-passwords)
```
echo "pinentry-program $(which pinentry-curses)" >>  $HOME/.gnupg/gpg-agent.conf
gpg-connect-agent reloadagent /bye
```


```
apt install pass
mkdir ~/.password-store
pass
pass git init dayne-store
pass 
```
