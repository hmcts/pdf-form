require "pdf_form/version"
require "ffi"
module PdfForm
  class Error < StandardError; end

  def self.get_form_data(file)
    PdfFormBinding.get_form_data(file)
  end

  module PdfFormBinding
    extend FFI::Library
    ffi_lib File.expand_path("../ext/pdf_form/pdf_form.so", __dir__)
    attach_function :get_form_data, [:string], :int
  end
end
