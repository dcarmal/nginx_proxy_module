# frozen_string_literal: true

require 'spec_helper'

describe 'nginx_proxy_module' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:hiera_config) { 'spec/fixtures/hiera/hiera.yaml' }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
