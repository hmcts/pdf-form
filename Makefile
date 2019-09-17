build:
	cd ext/pdf_form && go build -buildmode=c-shared -o pdf_form.so pdf_form.go

# fake out clean and install
clean:
install:

