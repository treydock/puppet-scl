require 'spec_helper'

describe 'scl::perl' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('scl::perl') }
  it { should contain_class('scl::params') }

  context "scl::collection" do
    it do
      should contain_yumrepo('scl_perl').with({
        'descr'          => 'Dynamic Software Collections - Perl',
        'baseurl'        => 'http://jplesnik.fedorapeople.org/repository/perl516/',
        'failovermethod' => 'priority',
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end

  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({ :operatingsystemrelease => 5.9 }) }

    it { expect { should create_class('scl::perl')}.to raise_error(Puppet::Error, /Unsupported operatingsystemrelease/) }
  end

end
