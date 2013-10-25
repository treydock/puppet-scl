require 'spec_helper_system'

describe 'scl::ruby193 class:' do
  context 'should run successfully' do
    pp =<<-EOS
class { 'scl::ruby193': }
package { 'ruby193': ensure => installed, require => Yumrepo['scl_ruby193'] }
    EOS
  
    context puppet_apply(pp) do
       its(:stderr) { should be_empty }
       its(:exit_code) { should_not == 1 }
       its(:refresh) { should be_nil }
       its(:stderr) { should be_empty }
       its(:exit_code) { should be_zero }
    end
  end

  describe yumrepo('scl_ruby193') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('ruby193') do
    it { should be_installed }
  end
end
