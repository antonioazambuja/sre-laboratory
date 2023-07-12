# sre-laboratory
Laboratory where I test new frameworks, new tools and any new things and insights...

## Quick started

Start this SRE Laboratory executing these commands:

```
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_REGION="us-east-1"
$ terraform plan
$ terraform apply
```

To access your instances use:

```
$ chmod 400 /path/key-pair-name.pem
$ ssh -i /path/key-pair-name.pem instance-user-name@instance-public-dns-name
```