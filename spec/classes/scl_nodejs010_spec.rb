require 'spec_helper'

describe 'scl::nodejs010' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('scl::nodejs010') }
  it { should contain_class('scl::params') }

  context "scl::collection" do
    it do
      should contain_yumrepo('nodejs010').with({
        'descr'          => 'Node.js 0.10.x Software Collection RPM repository for RHEL 6',
        'baseurl'        => 'http://sochotni.fedorapeople.org/nodejs010-RHSCL-1-RHEL-6/Server/x86_64/os/',
        'failovermethod' => 'priority',
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end

  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({ :operatingsystemrelease => 5.9 }) }

    it { expect { should create_class('scl::nodejs010')}.to raise_error(Puppet::Error, /Unsupported operatingsystemrelease/) }
  end

end
