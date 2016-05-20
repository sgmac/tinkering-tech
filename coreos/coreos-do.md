# CoreOS cluster on DigitalOcean
These are the notes from the Introduction to Coreos from Oreilly.

### 1. Setting up CoreOS cluster
**Before running the commands be sure to create a new  discovery url**

If you have set up your DO account, you can list the fingerprint for you SSH keys.

```
$ doctl  compute ssh-key list
ID      Name    FingerPrint
123456  default <YOUR_SSH_FINGERPRINT>
```
Now you can replace that fingerprint below:

```
https://discovery.etcd.io/new?size=3

doctl compute droplet create service1  --region sfo1  --size 1gb --image coreos-stable --user-data-file services1.yml --ssh-keys <SSH_FINGERPRINT>  --enable-private-networking --wait
doctl compute droplet create service2  --region sfo1  --size 1gb --image coreos-stable --user-data-file services2.yml  --ssh-keys <SSH_FINGERPRINT>  --enable-private-networking --wait
doctl compute droplet create service3  --region sfo1  --size 1gb --image coreos-stable --user-data-file services3.yml  --ssh-keys <SSH_FINGERPRINT>  --enable-private-networking --wait
```

### 2. Install fleetctl locally

Go to github and download the binary and add it to your path:

```
$ ssh-add ~/.ssh/private_key_added_to_cluster
```

Now you can use fleetctl;

```
~>{~}dols
ID              Name            Public IPv4     Memory  VCPUs   Disk    Region  Image                           Status  Tags
15266908        service1        45.55.29.131    1024    1       30      sfo1    CoreOS 899.17.0 (stable)        active
15266912        service2        159.203.218.208 1024    1       30      sfo1    CoreOS 899.17.0 (stable)        active
15266914        service3        159.203.214.13  1024    1       30      sfo1    CoreOS 899.17.0 (stable)        active
>{~}fleetctl  --tunnel=45.55.29.131  list-units
UNIT    MACHINE ACTIVE  SUB
```

### 3. Adding a worker

```
doctl compute droplet create worker1  --region sfo1  --size 1gb --image coreos-stable --user-data-file worker.yml  --ssh-keys <SSH_FINGERPRINT> --enable-private-networking --wait

doctl compute droplet create worker2  --region sfo1  --size 1gb --image coreos-stable --user-data-file worker.yml  --ssh-keys <SSH_FINGERPRINT> --enable-private-networking --wait
```


### 4.Tips

Before submiting any service check that you have the required variables.

Validate cloud-config, if returns null it's ok the file.
```
curl 'https://validate.core-os.net/validate' -X PUT --data-binary '@master.yml' | python -mjson.tool
```

