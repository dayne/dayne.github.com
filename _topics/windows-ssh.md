---

---

# background

Use ssh keys instead of passwords.  Have a password for your key.  Don't lose your key.

Others have better run downs than this: [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-create-ssh-keys-with-putty-to-connect-to-a-vps)

# download putty & things

http://www.putty.org/

http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html

Download 3 things:

* putty # ssh terminal
* puttygen # key genorator
* pagent # a SSH key agent

These do not have installers. They are stand alone applications.  Put them where you can access them easily (desktop, apps folder, where-ever is easy).

#  Generate a key (with password)

Launch puttygen

* SSH-2 RSA
* 4096 as number of bits generated

Generate a new key file (wiggle your mouse in the big empty box).

* key comment: (keyword that makes sense to you)-(current year)

# Save the key (in a few formats)

Putty has it's own key format different than openssh, so when saving it give yourself the reminder of which format the key is in:

* Save public key (keyword)-putty-public
* Save private key (keyword)-putty-private
* Save public key (keyword)-openssh-public.txt 
 * have to copy and paste from the text dialog box

# Don't lose those keys

*Keep them safe, keep them secret*

Put the public keys all over the world!

# Launch pagent

Launch the agent and load up the putty key

# Fun times

Now you can use winscp, putty, and other tools that talk to pagent to login to systems with your keys in place



