vast-java cookbook
==================

Install Oracle JDK based on environment.

Attributes
----------

Define `java_versions` attribute through Chef role or node object directly

```json
{
  "name": "javaE",
  "description": "Define a list of all Oracle JDK versions per environment",
  "json_class": "Chef::Role",
  "default_attributes": {
    "java_versions": {
       "alpha": [
         "9.0.4",
         "8u162"
       ],
       "beta": [
         "9.0.4",
         "8u162"
       ],
       "prod": [
         "9.0.4",
         "8u162"
       ]
    }
  },
  "override_attributes": {
  },
  "chef_type": "role",
  "run_list": [
    "recipe[vast-java]"
  ],
  "env_run_lists": {
  }
}
```

Usage
-----

Replace url and checksum in default attributes file

```ruby
default['java']['downloads'] = {
  '8u162' => {
    'url' => 'http://download.oracle.com/otn-pub/java/jdk/%{version}-b12/0da788060d494f5095bf8624735fa2f1/%{filename}',
    'checksum' => '68ec82d47fd9c2b8eb84225b6db398a72008285fafc98631b1ff8d2229680257',
  },
  '9.0.4' => {
    'url' => 'http://download.oracle.com/otn-pub/java/jdk/%{version}+11/c2514751926b4512b076cc82f959763f/%{filename}',
    'checksum' => '90c4ea877e816e3440862cfa36341bc87d05373d53389ec0f2d54d4e8c95daa2',
  }
}
```

Set same version for one or all environments inside the role

```json
"java_versions": {
       "alpha": [
         "9.0.4",
         "8u162"
       ],
       "beta": [
         "9.0.4",
         "8u162"
       ],
       "prod": [
         "9.0.4",
         "8u162"
       ]
    }
```

Include `javaE` role in node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "role[javaE]"
  ]
}
```
