require 'chef/provisioning'
require 'chef/provisioning/vsphere_driver'

#
# This is the main way to connect to vSphere
#
with_vsphere_driver host: '172.16.20.2',
  insecure: true,
  user:     'administrator@vsphere.local',
  password: 'Good4bye!'

#
# These are the machine_options that you need to declare
#
with_machine_options :bootstrap_options => {
                               num_cpus: 2,
                               memory_mb: 4096,
                               datacenter: 'Datacenter',
                               resource_pool: 'Cluster',
                               template_name: 'centos7-tmpl',
                               :ssh => {
                                 :user => 'root',
                                 :password => 'admini',
                                 :paranoid => false,
                               },
                               bootstrap_ipv4: true,

                               # An iso needs to be uploaded to a datastore, and updated here
                               initial_iso_file: '[vsanDatastore] 2fbd4e5a-c730-115a-e64f-0026b956b1e3/CentOS-7-x86_64-Minimal-1708.iso'
                             }

#
# This is where you can declare the machine
#
machine "testing-centos-with-iso" do
  tag "haha"
  tag "iso"
end
