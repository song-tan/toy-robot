# frozen_string_literal: true

RSpec.describe Direction do
  let(:direc_keys) { Direction.keys }
  let(:direc_values) { Direction.values }

  it 'Direction have array of keys' do
    expect(direc_keys).to be_kind_of Array
  end

  it 'have four directions keys' do
    expect(direc_keys.length).to eq 4
  end

  it 'have four directions values' do
    expect(direc_values.length).to eq 4
  end
end
