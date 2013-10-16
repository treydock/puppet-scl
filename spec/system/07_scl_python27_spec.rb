require 'spec_helper_system'

describe 'scl::python27 class:' do
  context 'should run successfully' do
    pp =<<-EOS
class { 'scl::python27': }
package { 'python27-python': ensure => installed, require => Yumrepo['scl_python27'] }
    EOS
  
    context puppet_apply(pp) do
       its(:stderr) { should be_empty }
       its(:exit_code) { should_not == 1 }
       its(:refresh) { should be_nil }
       its(:stderr) { should be_empty }
       its(:exit_code) { should be_zero }
    end
  end

  describe yumrepo('scl_python27') do
    it { should exist }
    it { should be_enabled }
  end

  describe package('python27-python') do
    it { should be_installed }
  end
end
