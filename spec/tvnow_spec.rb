require 'spec_helper'

describe Tvnow do
  it 'has a version number' do
    expect(Tvnow::VERSION).not_to be nil
  end

  it 'retruns array' do
    expect(Tvnow::Client.new.get_program_list).to be_an_instance_of(Array)
  end
end
