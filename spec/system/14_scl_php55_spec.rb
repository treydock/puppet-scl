require 'spec_helper_system'

describe 'scl::php55 class:' do
  context 'should run successfully' do
    pp =<<-EOS
class { 'scl::php55': }
package { 'php55-php': ensure => installed, require => Yumrepo['php55'] }
    EOS
  
    context puppet_apply(pp) do
       its(:stderr) { should be_empty }
       its(:exit_code) { should_not == 1 }
       its(:refresh) { should be_nil }
       its(:stderr) { should be_empty }
       its(:exit_code) { should be_zero }
    end
  end

  describe yumrepo('php55') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('php55-php') do
    it { should be_installed }
  end

  describe yumrepo('epel-httpd24') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('httpd24-httpd') do
    it { should be_installed }
  end
end
