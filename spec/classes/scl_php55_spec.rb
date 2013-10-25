require 'spec_helper'

describe 'scl::php55' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('scl::php55') }
  it { should contain_class('scl::params') }
  it { should include_class('scl::httpd24') }

  context "scl::collection" do
    it do
      should contain_yumrepo('php55').with({
        'descr'          => 'PHP 5.5 Software Collection for RHEL',
        'baseurl'        => 'http://people.redhat.com/rcollet/php55/rhel/$releasever/$basearch/',
        'failovermethod' => nil,
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end

  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({ :operatingsystemrelease => 5.9 }) }

    it { expect { should create_class('scl::php55')}.to raise_error(Puppet::Error, /Unsupported operatingsystemrelease/) }
  end

end
