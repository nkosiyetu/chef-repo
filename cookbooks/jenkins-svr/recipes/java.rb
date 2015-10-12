#
# Cookbook Name:: jenkins-svr
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node['platform_family']
when 'debian'
  package "python3-software-properties" do
    action :install
  end

  package "software-properties-common" do
    action :install
  end

  execute "download-installer" do
    command "sudo add-apt-repository -y ppa:webupd8team/java"
  end

  execute "apt-get-update" do
    command "sudo apt-get update -y"
  end

  execute "debconf-utils" do
    command "sudo apt-get install -y python-software-properties debconf-utils"
  end

  execute "accept-license" do
    command "echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true" 
  end

  execute "exec-debconf" do
    command "sudo debconf-set-selections"
  end

  execute "install-java" do
    command "sudo apt-get -y install oracle-java7-installer"
  end

when 'rhel'
  execute "install-java" do
    command "yum update -y"
  end
else
  fail "`#{node['platform_family']}' is not supported!"
end
