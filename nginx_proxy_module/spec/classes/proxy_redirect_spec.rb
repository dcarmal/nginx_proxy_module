# frozen_string_literal: true

redirects = {
  'proxy1' => [
    ['https://domain.com', '10.10.10.10'],
  ],
  'proxy2' => [
    ['https://domain.com/resource2', '20.20.20.20'],
  ],
}

require 'spec_helper'

describe 'nginx_proxy_module::proxy_redirect' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      it 'expected to contain a notice with the expected text' do
        redirects.each do |proxy_name, proxy_data|
          origin = proxy_data[0][0]
          target = proxy_data[0][1]
          is_expected.to contain_nginx__resource__location(proxy_name).with(
            'location'            => '/',
            'server'              => proxy_name,
            'proxy_redirect'      => target,
            'location_cfg_append' => {
              'proxy_pass' => origin,
            },
          )
        end
      end
    end
  end
end
