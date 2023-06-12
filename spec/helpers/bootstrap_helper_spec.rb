require "rails_helper"

# Specs in this file have access to a helper object that includes
# the BootstrapHelper. For example:
#
# describe BootstrapHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BootstrapHelper, type: :helper do
  it "returns success class for success event" do
    expect(helper.bootstrap_class_for("success")).to eq("success")
  end

  it "returns danger class for error event" do
    expect(helper.bootstrap_class_for("error")).to eq("danger")
  end

  it "returns warning class for alert event" do
    expect(helper.bootstrap_class_for("alert")).to eq("warning")
  end

  it "returns primary class for notice event" do
    expect(helper.bootstrap_class_for("notice")).to eq("primary")
  end
end
