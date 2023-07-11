# frozen_string_literal: true

require 'spec_helper'

describe 'nginx_proxy_module::proxy_redirect' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      it 'should contain a notice with the expected text' do
        is_expected.to contain_notify('Encontrada URL: https://domain.com')
        is_expected.to contain_notify('Encontrada URL: https://domain.com/resource2')
        is_expected.to contain_notify("Encontrado objetivo: 10.10.10.10")
        is_expected.to contain_notify("Encontrado objetivo: 20.20.20.20")
      end
    end
  end
end
