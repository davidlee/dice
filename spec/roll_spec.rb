
describe Roll::Parser::RX do
  let(:rx) { described_class }
  subject(:match) { }

  it 'should match 3d6' do
    expect(rx.match('3d6')).not_to be_nil
  end

  it 'should match 3d6+1' do
    expect(rx.match('3d6+1')).not_to be_nil
  end

end