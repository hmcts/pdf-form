require "pdf_form/version"
require "ffi"
module PdfForm
  class Error < StandardError; end

  def self.get_form_data(file)
    p_out = PdfFormBinding.get_form_data(file)
    p_out.read_string
  ensure
    PdfFormBinding.free_string(p_out) if p_out
  end

  module PdfFormBinding
    extend FFI::Library
    ffi_lib File.expand_path("../ext/pdf_form/pdf_form.so", __dir__)
    attach_function :get_form_data, [:string], :pointer
    attach_function :free_string, [:pointer], :void
  end
end
