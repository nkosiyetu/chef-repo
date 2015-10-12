#
# Cookbook Name:: jenkins-svr
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "download-jenkins" do
  command "wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -"
end

execute "download-jenkins" do
  command "sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'"
end

execute "apt-update" do
  command "sudo apt-get update -y"
end

#install jenkins
package "jenkins" do
  action :install
end

service "jenkins" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
