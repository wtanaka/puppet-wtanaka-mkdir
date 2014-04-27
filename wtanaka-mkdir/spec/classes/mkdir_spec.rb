require 'spec_helper'

describe 'mkdir', :type => 'class' do
   it { should compile }
   it { should compile.with_all_deps }
   it { should contain_class('mkdir') }
end
