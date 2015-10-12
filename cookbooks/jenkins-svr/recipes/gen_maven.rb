#
# Cookbook Name:: jenkins-svr
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/home/vagrant/mvn_test1' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

execute "generate-maven-project" do
  user "vagrant"                                                                
  group "vagrant"                                                                
  action :run  
  command "cd /home/vagrant/mvn_test1; mvn archetype:generate -DgroupId=com.clopes \
     -DartifactId=HelloWorld -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false"
end
