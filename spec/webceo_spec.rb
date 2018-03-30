require "spec_helper"

RSpec.describe Webceo do
  it "has a version number" do
    expect(subject.gem_version).not_to be nil
  end
end
