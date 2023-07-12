# frozen_string_literal: true

require 'spec_helper'

describe 'nginx_proxy_module::proxy_redirect' do
  # hiera = RSpec::Puppet::Hiera.new
  let(:hiera_data) do
    RSpec::Puppet::Support::Hiera.lookup('nginx_proxy_module::proxy_redirect::redirects')
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      it 'expected to contain a notice with the expected text' do
        hiera_data.each do |proxy_name, proxy_data|
          origin = proxy_data[0][0]
          target = proxy_data[0][1]
          is_expected.to contain_notify("Servidor #{proxy_name} - Encontrado origen: #{origin} apuntando a destino #{target}")
        end
      end
    end
  end
end
