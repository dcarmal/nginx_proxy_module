# frozen_string_literal: true

require 'spec_helper'

describe 'nginx_proxy_module::forward_proxy' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      it {
        is_expected.to contain_nginx__resource__server('forward_proxy').with(
          'listen_port'         => 80,
          'proxy'               => 'http://$http_host$request_uri',
          'proxy_set_header'    => ['X-Real-IP $remote_addr'],
          'access_log'          => '/var/log/nginx/forward_proxy.access.log',
          'error_log'           => '/var/log/nginx/forward_proxy.error.log',
          'location_cfg_append' => {
            'proxy_pass' => 'http://$host$request_uri',
          },
          # 'custom_config' => template('access_log.erb'),
        )
      }
    end
  end
end
