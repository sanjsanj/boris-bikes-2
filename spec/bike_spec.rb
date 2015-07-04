require 'bike'

describe Bike do
  it 'responds to working' do
    expect(subject).to respond_to :working?
  end

  it 'is not broken when instantiated' do
    expect(subject).to be_working
  end
end
