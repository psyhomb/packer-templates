# Author: Milos Buncic
# Description: Installs Oracle Java JDK based on the environment (defined via role or node objects)
#
###
#
# How to download Oracle Java JDK with curl
# Example:
#   curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.tar.gz -O
# or
#   curl -L -H "Cookie: oraclelicense=accept" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.tar.gz -O

### Local vars
# Node environment
env = node.chef_environment
# Java path
java_home = '/usr/java'
# List of java versions per environment
java_versions = node['java_versions'][env]
# Download URLs and SHA256 checksums
downloads = node['java']['downloads']

### Create java directory
directory java_home do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

### Install java
# Show warn msg in log if java_versions is nil
if !java_versions.nil?
  # Run installation of all java versions defined in java_versions list
  java_versions.each do |version|
    major = version.split(/u|\./)[0]
    minor = version.split(/u|\./)[1..-1].join('.')

    filename = if major.to_i >= 9
                 "jdk-#{version}_linux-x64_bin.tar.gz"
               else
                 "jdk-#{version}-linux-x64.tar.gz"
               end

    vast_java_ark "install-jdk-#{version}" do
      url        downloads[version]['url'] % {version: version, filename: filename}
      checksum   downloads[version]['checksum']
      app_home   "#{java_home}/latest#{major}"
      action     :install
    end
  end
else
  Chef::Log.warn("vast-java: No Java versions to install for #{env} environment! Are java_versions hash and env on node valid?")
end
