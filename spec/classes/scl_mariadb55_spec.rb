require 'spec_helper'

describe 'scl::mariadb55' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('scl::mariadb55') }
  it { should contain_class('scl::params') }

  context "scl::collection" do
    it do
      should contain_yumrepo('rhel-6-scl-mariadb55').with({
        'descr'          => 'rhel-6-scl-mariadb55',
        'baseurl'        => 'http://people.redhat.com/~hhorak/software-collections/mariadb55-rhel-6-candidate/',
        'failovermethod' => nil,
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end

  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({ :operatingsystemrelease => 5.9 }) }

    it { expect { should create_class('scl::mariadb55')}.to raise_error(Puppet::Error, /Unsupported operatingsystemrelease/) }
  end

end
