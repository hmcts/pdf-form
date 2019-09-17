#include "pdf_form.h"

VALUE rb_mPdfForm;

void
Init_pdf_form(void)
{
  rb_mPdfForm = rb_define_module("PdfForm");
}
