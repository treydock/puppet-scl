require 'spec_helper'

describe 'scl' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('scl') }
  it { should contain_class('scl::params') }

  it do
    should contain_package('scl-utils').with({
      'ensure'    => 'present',
      'name'      => 'scl-utils',
    })
  end
end
