knife bootstrap 52.207.245.236 \
             --ssh-user ubuntu \
              --sudo \
              --identity-file /home/ubuntu/nodekey123.pem \
      -N "ec2-52-207-245-236.compute-1.amazonaws.com"


#
# Cookbook Name:: tomcatsix
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# This is ubuntu 16.04
osname = node["platform"]
if osname == "ubuntu"
        package_namee = "openjdk-8-jre-headless"
        package_name = "tomcat8"
elsif osname == "redhat"
        package_namee = "java-1.6.0-openjdk-devel"
        package_name  = "tomcat6 tomcat6-webapps tomcat6-admin-webapps"
elsif osname == "suse"
        package_namee = "java-1.6.0-openjdk-devel"
        package_name  = "tomcat6"
end
package package_namee do
        action :install
end
package package_name do
        action :install
end
remote_file '/var/lib/tomcat8/webapps/benefits.war' do
        source 'http://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/12c/03-DeployApps/files/benefits.war'
        mode '0755'
end
service package_name do
  action :restart
end


# For ubuntu 14.04..

osname = node["platform"]
if osname == "ubuntu"
        package_name = "openjdk-7-jdk"
        package_name = "tomcat6"
elsif osname == "redhat"
        package_name = "java-1.6.0-openjdk-devel"
        package_name = "tomcat6 tomcat6-webapps tomcat6-admin-webapps"
elsif osname == "suse"
        package_name = "java-1.6.0-openjdk-devel"
        package_name = "tomcat6"
end
package package_name do
        action :install
end
# package package_name do
#        action :install
# end
remote_file '/var/lib/tomcat6/webapps/benefits.war' do
        source 'http://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/12c/03-DeployApps/files/benefits.war'
        mode '0755'
end
service package_name do
  action :restart
end



