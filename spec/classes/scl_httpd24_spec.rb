require 'spec_helper'

describe 'scl::httpd24' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('scl::httpd24') }
  it { should contain_class('scl::params') }

  context "scl::collection" do
    it do
      should contain_yumrepo('epel-httpd24').with({
        'descr'          => 'httpd-2.4 scl',
        'baseurl'        => 'http://repos.fedorapeople.org/repos/jkaluza/httpd24/epel-$releasever/$basearch/',
        'failovermethod' => nil,
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end

  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({ :operatingsystemrelease => 5.9 }) }

    it { expect { should create_class('scl::httpd24')}.to raise_error(Puppet::Error, /Unsupported operatingsystemrelease/) }
  end

end
