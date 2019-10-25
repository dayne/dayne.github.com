---
title: GPG keys
layout: default
---


My current GPG keys are available at [dayne.broderson.org/GPG/2018](./2018)

---

# GPG quick start

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

## get key id and public key file

`gpg --list-secret-keys --keyid-format LONG`

```
GPG_KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | grep sec \
         | sed 's/\// /g' | awk '{print $3}')
echo GPG_KEY_ID=$GPG_KEY_ID
gpg --armor --export $GPG_KEY_ID > $GPG_KEY_ID.gpg.pub
echo "exported GPG_KEY_ID as GPG public key file: $GPG_KEY_ID.gpg.pub"
```

## incorperate the key into life

### configure git to use it as signing key

`git config --global user.signingkey $GPG_KEY_ID`

Then add the public key (`$GPG_KEY_ID.gpg.pub`) to your [GitHub account
settings](https://github.com/settings/keys).  More details at [GitHub's help
page](https://help.github.com/articles/telling-git-about-your-signing-key/)

## configure pass to use your gpg key

if you've not setup pass here is quick start:
```
sudo apt install pass
```

Initialize pass with your GPG key:
```
pass init $GPG_KEY_ID
```

## setup docker to use it


* install docker-credential-helpers in your path
* config `.docker/config.json` with  
  ```
  { 
     "credsStore": "pass"
  }
  ```
* `docker login`
* verify it worked with `pass` - should see a `docker-credential-helpers` as one
  of the storage buckets.

More detail in https://github.com/docker/docker-credential-helpers/issues/102


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
