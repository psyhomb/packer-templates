# If you change this to true, you can download directly from Oracle
default['java']['oracle']['accept_oracle_download_terms'] = true

# List of java versions per environment
# Warn: do not alter hash key/values here, use role or node objects instead
default['java_versions'] = {}

# SHA256 checksums (for more information see 'Usage' section in README.md)
# Note: Be sure to replace version with %{version} and filename with %{filename} variables
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
