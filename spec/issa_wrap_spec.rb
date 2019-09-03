RSpec.describe IssaWrap do
  it "has a version number" do
    expect(IssaWrap::VERSION).not_to be nil
  end

  it "returns an empty string" do
    expect(IssaWrap::Wrapper.wrap(nil,5)).to eq("")
    expect(IssaWrap::Wrapper.wrap("",5)).to eq("")
  end

  it "returns string if string is shorter than column" do
    expect(IssaWrap::Wrapper.wrap("word",4)).to eq("word")
    expect(IssaWrap::Wrapper.wrap("word",7)).to eq("word")
    expect(IssaWrap::Wrapper.wrap("some words",12)).to eq("some words")
  end

  it "returns breaks string on column" do
    expect(IssaWrap::Wrapper.wrap("longword",4)).to eq("long\nword")
    expect(IssaWrap::Wrapper.wrap("verylongword",4)).to eq("very\nlong\nword")
    expect(IssaWrap::Wrapper.wrap("longishword",7)).to eq("longish\nword")
  end

  it "breaks at spaces where possible" do
    expect(IssaWrap::Wrapper.wrap("long word",4)).to eq("long\nword")
    expect(IssaWrap::Wrapper.wrap("very long word",4)).to eq("very\nlong\nword")
  end

end
