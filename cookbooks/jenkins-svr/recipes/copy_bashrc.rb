# Copy .profile with JAVA_HOME

cookbook_file "/home/vagrant/.profile" do
  source "profile"
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
  action :create
end

