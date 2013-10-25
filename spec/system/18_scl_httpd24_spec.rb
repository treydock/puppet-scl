require 'spec_helper_system'

describe 'scl::httpd24 class:' do
  context 'should run successfully' do
    pp =<<-EOS
class { 'scl::httpd24': }
package { 'httpd24-httpd': ensure => installed, require => Yumrepo['epel-httpd24'] }
    EOS
  
    context puppet_apply(pp) do
       its(:stderr) { should be_empty }
       its(:exit_code) { should_not == 1 }
       its(:refresh) { should be_nil }
       its(:stderr) { should be_empty }
       its(:exit_code) { should be_zero }
    end
  end

  describe yumrepo('epel-httpd24') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('httpd24-httpd') do
    it { should be_installed }
  end
end
