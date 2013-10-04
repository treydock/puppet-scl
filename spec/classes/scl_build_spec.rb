require 'spec_helper'

describe 'scl::build' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('scl::build') }
  it { should contain_class('scl::params') }

  it do
    should contain_package('scl-utils-build').with({
      'ensure'    => 'present',
      'name'      => 'scl-utils-build',
    })
  end
end
