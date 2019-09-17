require "pdf_form/version"
require "ffi"
require "json"
module PdfForm
  class Error < StandardError; end
  class Field
    def initialize(name:, value:)
      self.name = name
      self.value = value
    end

    attr_reader :name, :value

    private

    attr_writer :name, :value
  end
  class FieldWithOptions < Field
    attr_reader :options

    def initialize(options:, **kw_args)
      super(**kw_args)
      self.options = options
    end

    private

    attr_writer :options
  end
  def self.get_form_data(file)
    p_out = PdfFormBinding.get_form_data(file)
    json = JSON.parse(p_out.read_string)
    json.map do |f|
      if f.key?('options')
        FieldWithOptions.new name: f['name'], value: f['value'], options: f['options']
      else
        Field.new name: f['name'], value: f['value']
      end
    end
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
