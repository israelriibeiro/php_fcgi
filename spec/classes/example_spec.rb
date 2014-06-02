require 'spec_helper'

describe 'php-fcgi' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "php-fcgi class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('php-fcgi::params') }
        it { should contain_class('php-fcgi::install').that_comes_before('php-fcgi::config') }
        it { should contain_class('php-fcgi::config') }
        it { should contain_class('php-fcgi::service').that_subscribes_to('php-fcgi::config') }

        it { should contain_service('php-fcgi') }
        it { should contain_package('php-fcgi').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'php-fcgi class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('php-fcgi') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
