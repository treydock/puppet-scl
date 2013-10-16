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
    let(:title) { "scl_ImageMagick67" }

    let(:params) do
      {
        :repo_descr           => 'scl_ImageMagick67',
        :repo_baseurl         => 'http://foo.example.com/scl_ImageMagick67/',
        :repo_enabled         => "1",
        :repo_gpgcheck        => "0",
      }
    end

    it do
      should contain_yumrepo('scl_ImageMagick67').with({
        'descr'          => 'scl_ImageMagick67',
        'baseurl'        => 'http://foo.example.com/scl_ImageMagick67/',
        'failovermethod' => nil,
        'enabled'        => '1',
        'gpgcheck'       => '0',
      })
    end
  end
end
