# frozen_string_literal: true

require 'spec_helper'

describe 'nginx_proxy_module::proxy_redirect' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      # it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }

      it 'expected to contain a notice with the expected text' do
        is_expected.to contain_notify('Encontrado origen: https://domain.com apuntando a destino 10.10.10.10')
        is_expected.to contain_notify('Encontrado origen: https://domain.com/resource2 apuntando a destino 20.20.20.20')
      end
    end
  end
end
