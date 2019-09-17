RSpec.describe PdfForm do
  subject(:service) { described_class }
  it "has a version number" do
    expect(PdfForm::VERSION).not_to be nil
  end

  it "does something useful" do
    file = File.absolute_path("./fixtures/example.pdf", __dir__)
    expect(subject.get_form_data(file)).to include an_object_having_attributes name: "case number", value: "2454321/2017"
  end
end
