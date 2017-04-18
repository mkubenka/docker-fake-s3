require 'spec_helper'

describe 'fakes3' do
  describe command('/usr/bin/fakes3 version') do
    its(:exit_status) { should eq 0 }
  end
end
