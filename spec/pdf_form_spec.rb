RSpec.describe PdfForm do
  subject(:service) { described_class }
  it "has a version number" do
    expect(PdfForm::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(subject.get_form_data("sdsd")).to eq("Hello World")
  end
end
