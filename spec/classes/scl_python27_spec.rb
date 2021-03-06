require 'spec_helper'

describe 'scl::python27' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('scl::python27') }
  it { should contain_class('scl::params') }

  context "scl::collection" do
    it do
      should contain_yumrepo('scl_python27').with({
        'descr'          => 'Python 2.7 Dynamic Software Collection',
        'baseurl'        => 'http://people.redhat.com/bkabrda/python27-rhel-6/',
        'failovermethod' => 'priority',
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end

  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({ :operatingsystemrelease => 5.9 }) }

    it { expect { should create_class('scl::python27')}.to raise_error(Puppet::Error, /Unsupported operatingsystemrelease/) }
  end

end
