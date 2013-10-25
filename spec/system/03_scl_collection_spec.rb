require 'spec_helper_system'

describe 'scl::collection define:' do
  context 'should run successfully' do
    pp =<<-EOS
scl::collection { 'scl_ImageMagick67':
  repo_descr    => 'scl_ImageMagick67',
  repo_baseurl  => 'http://yum.tamu.edu/software-collections/ImageMagick67-rhel-6/',
  repo_enabled  => '1',
  repo_gpgcheck => '0',
}
package { 'ImageMagick67-ImageMagick': ensure => installed, require => Yumrepo['scl_ImageMagick67'] }
    EOS
  
    context puppet_apply(pp) do
       its(:stderr) { should be_empty }
       its(:exit_code) { should_not == 1 }
       its(:refresh) { should be_nil }
       its(:stderr) { should be_empty }
       its(:exit_code) { should be_zero }
    end
  end

  describe yumrepo('scl_ImageMagick67') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('ImageMagick67-ImageMagick') do
    it { should be_installed }
  end
end
