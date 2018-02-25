Ubuntu 16.04 LTS with JDK
=========================

About
-----

[Packer](https://www.packer.io/docs/index.html) template with [chef-solo](https://docs.chef.io/chef_solo.html) provisioner.

Edit
----

Replace `<ACCESS_KEY>` and `<SECRET_KEY>` with valid keys of the account with minimal [permissinos](https://www.packer.io/docs/builders/amazon.html#iam-task-or-instance-role) set necessary for Packer to work.

[secrets.json](../secrets.json)

```json
{
  "aws_access_key": "<ACCESS_KEY>",
  "aws_secret_key": "<SECRET_KEY>"
}
```

Validate
--------

```plain
packer validate ubuntu1604-jdk-template.json
```

Build
-----

```plain
packer build -var-file secrets.json ubuntu1604-jdk-template.json
```