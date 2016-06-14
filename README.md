# Puppet Webhosing Control Repo

Originally forked from https://github.com/puppetlabs/control-repo in early 2016

## What's this?

This is a simple Puppet control repo demonstrating how you might set up a webhosting machine running Apache, PHP, MySQL, Wordpress, and a primary DNS server running BIND.

It is intended for a quick-and-dirty masterless puppet architecture, so it configures the puppet agent to not start on boot, etc.

I created this repo after a friend suggested you would need to write about 1,000 lines of Puppet code to set up a webserver for hosting PHP websites. This solution has 57 required lines. There's other puppet code in this repository that does other things like setting up a static site (no PHP), setting up BIND if you want to run a primary nameserver, and so on. 
- `role::wordpress_server_1` - 8 lines
- `profile::wordpress` - 36 lines
- `profile::mysql` - 10 lines
- `profile::base` - 23 lines (but none of this is actually necessary to achieve the stated aim)
- `site.pp` - 3 lines

### Quick Start

Pre-requisites:

- Linux 64 bit x86
- [Puppet Agent](https://docs.puppet.com/puppet/latest/reference/install_linux.html)
- [r10k ruby gem](https://github.com/puppetlabs/r10k) - Install into a system ruby, or Puppet's ruby

Fork this repo on github.

Modify the websites you want instantiated by editing `site/role/manifests/wordpress_server_1.pp`

Classify your node(s) as either wordpress servers, or primay dns servers (or both) by modifying `manifests/site.pp`

Configure r10k:

Create the `/etc/puppetfile/r10k/r10k.yaml` config file from the example contained in the ruby gem, and customise the git URL to point to your fork of this repo.

Run r10k to deploy your code:

```bash
r10k deploy environment -pv
```

Next, run puppet in noop to inspect changes:

```bash
puppet apply --noop --modulepath \
  /etc/puppetlabs/code/environments/production/modules:/etc/puppetlabs/code/environments/production/site \
  /etc/puppetlabs/code/environments/production/manifests/site.pp
```

And now in enforce mode:

```bash
puppet apply --modulepath \
  /etc/puppetlabs/code/environments/production/modules:/etc/puppetlabs/code/environments/production/site \
  /etc/puppetlabs/code/environments/production/manifests/site.pp
```
