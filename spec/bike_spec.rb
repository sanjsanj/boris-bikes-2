require 'bike'

describe Bike do
  it 'responds to working' do
    expect(subject).to respond_to :working?
  end

  it 'is not broken when instantiated' do
    expect(subject).to be_working
  end

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end
end
