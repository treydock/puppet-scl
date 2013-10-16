require 'spec_helper_system'

describe 'scl::perl class:' do
  context 'should run successfully' do
    pp =<<-EOS
class { 'scl::perl': }
package { 'perl516-perl': ensure => installed, require => Yumrepo['scl_perl'] }
    EOS
  
    context puppet_apply(pp) do
       its(:stderr) { should be_empty }
       its(:exit_code) { should_not == 1 }
       its(:refresh) { should be_nil }
       its(:stderr) { should be_empty }
       its(:exit_code) { should be_zero }
    end
  end

  describe yumrepo('scl_perl') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('perl516-perl') do
    it { should be_installed }
  end
end
