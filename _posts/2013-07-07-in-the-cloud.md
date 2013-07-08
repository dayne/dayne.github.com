---
title: "In the Cloud"
layout: post
---

# {{page.title}} #

[Teknofire](http://teknofire.net) and I have dived into the cloud in the last couple weeks.  _daynes cloud term means: internet magic sauce I am not running the hardware for_

We launched [Damn It Alex](http://damnitalex.com) using GitHub's Jekyll hosting CDN magic. Free cloud hosting by GitHub.  I'll take it.

Following that super easy success we discussed using Amazon EC2 virtual machines as hosting boxes.  *blamo* next thing I know Will has gone and launched his [Ruby RSS Reader in EC2](http://reader.teknofire.net).  _never trust a ninja_

I had wasted a bunch of time trying to figure out how to combine chef, fog, and EC2 into a recipe and in a fraction of the time Will just clicked through GUI and launched a RHEL6.4 box.

# Amazon EC2 - Just Do It # 

* us-west region 
* AMI: ubuntu/images/ebs/ubuntu-raring-13.04-amd64-server-20130423 (ami-bf1d8a8f)
* Security rules: port 22, and port 80 from everywhere
* made it easy to just type `ssh cloud` to get into the running instance
* added swap space in case I did something silly with the default 600MB of RAM

...

## .ssh/config ##

When created the new machine I created a new key-pair - download PEM file - tossed into .ssh/cloud.pem

Then to make access the running instance as easy as `ssh cloud` I added the following 'cloud' host entry to .ssh/config

<pre>
host cloud
  user ubuntu
  HostName #REDACTED#.us-west-2.compute.amazonaws.com
  IdentityFile ~/.ssh/cloud.pem
  ForwardAgent yes
</pre>
<br />
 
## Adding 1GB swapfile ##

Then to make sure I had wiggle room during compiles and other silly stuff following:

<pre>
sudo su -
dd if=/dev/zero of=/swapfile bs=1M count=1024
mkswap /swapfile
swapon /swapfile 
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
</pre>

## DNS record ##

The quick start for getting a domain pointing at your EC2 instance is to take the *Public DNS* record for the instance and use it as a CNAME target.  Super easy so clearly not for me. _I want my A record_

To do this create an elastic IP address and assigned it to the instance.  This triggers the instance to abandon the initial IP address allocated... without a reboot even. _magic sauce sprinkles_  Minor tweak to update .ssh/config for new address and good to go.

Pricing for the elastic IP appears to be free (on top if per-hour charge of my instance) as long as you keep one instance and one IP - which is all good.

[aws article on elastic IPs pricing](http://aws.amazon.com/articles/1346)

To truely be crazy Amazon AWS only we should look more carefully at [Amazon Route 53](http://aws.amazon.com/route53/) for hosting the DNS records for these efforts.

## Apache web server ##

Next step is to make something live here.  Port 80 is open but nobody is listening.  Apache would be normally be my flavor of choice but not today. Nginx learning time. random google response for [ubuntu nginx](https://www.digitalocean.com/community/articles/how-to-install-nginx-on-ubuntu-12-04-lts-precise-pangolin)

<pre>
sudo apt-get install nginx      # install
sudo service nginx start        # start right now
sudo update-rc.d nginx defaults # start on boot
</pre>

Too easy... _if you consider a default blank website success_
