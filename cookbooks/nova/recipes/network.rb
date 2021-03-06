#
# Cookbook Name:: nova
# Recipe:: network
#
# Copyright 2012, Rackspace US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "nova::nova-common"
include_recipe "monitoring"

platform_options = node["nova"]["platform"]

platform_options["nova_network_packages"].each do |pkg|
  package pkg do
    action :upgrade
    options platform_options["package_overrides"]
  end
end

service "nova-network" do
  service_name platform_options["nova_network_service"]
  supports :status => true, :restart => true
  action :enable
  subscribes :restart, resources(:template => "/etc/nova/nova.conf"), :delayed
end

monitoring_procmon "nova-network" do
  service_name=platform_options["nova_network_service"]

  process_name "nova-network"
  start_cmd "/usr/sbin/service #{service_name} start"
  stop_cmd "/usr/sbin/service #{service_name} stop"
end

monitoring_metric "nova-network-proc" do
  type "proc"
  proc_name "nova-network"
  proc_regex platform_options["nova_network_service"]

  alarms(:failure_min => 2.0)
end
