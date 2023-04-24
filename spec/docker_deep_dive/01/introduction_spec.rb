describe 'MRI' do
  it 'Should use the MRI interpreter' do
    expect(RbConfig::CONFIG["RUBY_INSTALL_NAME"]).to eq('ruby')
  end
end