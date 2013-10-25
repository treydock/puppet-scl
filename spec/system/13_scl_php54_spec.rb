require 'spec_helper_system'

describe 'scl::php54 class:' do
  context 'should run successfully' do
    pp =<<-EOS
class { 'scl::php54': }
package { 'php54-php': ensure => installed, require => Yumrepo['php54'] }
    EOS
  
    context puppet_apply(pp) do
       its(:stderr) { should be_empty }
       its(:exit_code) { should_not == 1 }
       its(:refresh) { should be_nil }
       its(:stderr) { should be_empty }
       its(:exit_code) { should be_zero }
    end
  end

  describe yumrepo('php54') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('php54-php') do
    it { should be_installed }
  end
end
