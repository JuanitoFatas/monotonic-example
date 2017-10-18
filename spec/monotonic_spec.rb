require "spec_helper"

RSpec.describe Monotonic do
  describe ".now" do
    it "returns monotonic time" do
      expect { Monotonic.now }.not_to raise_error
    end
  end
end
