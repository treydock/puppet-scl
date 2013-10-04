require 'spec_helper'

describe 'scl::collection' do
  include_context :defaults

  let(:facts) { default_facts }

  context "scl_ruby193" do
    let(:title) { "scl_ruby193" }

    it do
      should contain_yumrepo('scl_ruby193').with({
        'descr'          => 'Ruby 1.9.3 Dynamic Software Collection',
        'baseurl'        => 'http://people.redhat.com/bkabrda/ruby193-rhel-6/',
        'failovermethod' => 'priority',
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end
  
  context "custom collection" do
    let(:title) { "ImageMagick"}
  end
end
