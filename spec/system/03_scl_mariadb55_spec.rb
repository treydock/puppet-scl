require 'spec_helper_system'

describe 'scl::mariadb55 class:' do
  context 'should run successfully' do
    pp =<<-EOS
class { 'scl::mariadb55': }
package { 'mariadb55-mariadb-server': ensure => installed, require => Yumrepo['rhel-6-scl-mariadb55'] }
    EOS
  
    context puppet_apply(pp) do
       its(:stderr) { should be_empty }
       its(:exit_code) { should_not == 1 }
       its(:refresh) { should be_nil }
       its(:stderr) { should be_empty }
       its(:exit_code) { should be_zero }
    end
  end

  describe yumrepo('rhel-6-scl-mariadb55') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('mariadb55-mariadb-server') do
    it { should be_installed }
  end
end
