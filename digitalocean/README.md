# Digital Ocean

In order to build an infrastructure in DO from the cli you need to install [doctl](https://github.com/digitalocean/doctl).
Files in this folder:

- **provision.sh**: ``cloud-init`` installs ansible, clones the ansible-roles repository from my Github account and runs a playbook. This script is based in a _Ubuntu image_, update commands if you want to run a different OS.
- **README.md**: current doc file.

Read the roles I'm using [here](https://github.com/sgmac/ansible-roles), note that ``hashed_password`` can be created in two ways, in this example the  user is _deploy_  and the password is _ansible_.

```
$ openssl passwd -1 -salt 1234
Password: (ansible)
$1$1234$FqpZluKYwk4TEkBE1InBI.
$ mkpasswd -m md5 --salt 1234
Password: (ansible)
$1$1234$FqpZluKYwk4TEkBE1InBI.
```

## Doctl commands

**Loging**: ``$ doctl auth login`` 

**Create**: `` $ doctl compute droplet create do-test1  --region sfo1  --size 512Mb  --image ubuntu-14-04-x64 --user-data-file provision.sh --wait ``
```
ID              Name            Public IPv4     Memory  VCPUs   Disk    Region  Image                   Status  Tags
15494720        do-test1        159.203.192.59  512     1       20      sfo1    Ubuntu 14.04.4 x64      active
```

**Delete**:  ``$ doctl compute droplet delete 15494720``
```
deleted droplet 15494720
```
 
**Droplets**: ``$ doctl compute droplet ls ``

**Image**: ``$ doctl image list``

## Aliases

It can be tedious to run all those commands:


-  ```dols is aliased to doctl compute droplet ls```
-  ```dorm is aliased to doctl compute droplet delete $@``` 

