# frozen_string_literal: true

RSpec.describe Command do
  let(:cnd_keys) { Command.keys }
  let(:cnd_values) { Command.values }

  it 'Command have array of keys' do
    expect(cnd_keys).to be_kind_of Array
  end

  it 'have four commands keys' do
    expect(cnd_keys.length).to eq 6
  end

  it 'have four commands values' do
    expect(cnd_values.length).to eq 6
  end
end
