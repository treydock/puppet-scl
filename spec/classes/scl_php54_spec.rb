require 'spec_helper'

shared_context "scl::php54" do
  it { should create_class('scl::php54') }
  it { should contain_class('scl::params') }

  context "scl::collection" do
    it do
      should contain_yumrepo('php54').with({
        'descr'          => 'PHP 5.4 Software Collection for RHEL',
        'baseurl'        => 'http://people.redhat.com/rcollet/php54/rhel/$releasever/$basearch/',
        'failovermethod' => nil,
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end
end

describe 'scl::php54' do
  include_context :defaults

  let(:facts) { default_facts }

  include_context "scl::php54"

  context "operatingsystemrelease => 5.9" do
    let(:facts) { default_facts.merge({ :operatingsystemrelease => 5.9 }) }

    include_context "scl::php54"
  end

end
