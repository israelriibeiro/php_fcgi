require 'spec_helper'
describe 'php_fcgi::config', :type => :define do
	describe 'php_fcgi::config internals' do
        	let(:title) { 'test.com.br' }
		let(:params) { { :bind => 'test.com.br',
        	                 :user => 'www-data',
				 :php_fcgi_children => '1',
				 :php_fcgi_max_requests => '100'  } }


		it do should contain_service('php_fcgi_test.com.br').with(
			  'ensure'     => 'running',
			  'enable'     => 'true',
			  'hasstatus'  => 'true',
			  'hasrestart' => 'true' ) 
		end

		it do should contain_file('/etc/init.d/php_fcgi_test.com.br').with({
			  'ensure'     => 'present',
			  'mode'     => '0755',
			  'owner'  => 'root',
			  'group' => 'root',
			 # 'require' => 'Package[php-fcgi]',
			  'notify' => 'Service[php_fcgi_test.com.br]'}) 
		end
       end
end

