package main
// #include <stdlib.h>
import "C"
import (
	"fmt"
	"github.com/unidoc/unipdf/v3/fjson"
	"unsafe"
)

type Field struct {
	name string
	flags string
	justification string
	fieldType string
	value string
}
//export get_form_data
func get_form_data(filePath *C.char) *C.char {
    var (
        inputPath	string
    )
    inputPath = C.GoString(filePath)

	fdata, err := fjson.LoadFromPDFFile(inputPath)
	if err != nil {
		errStr := fmt.Sprintf("{\"error\": \"%v\"}", err)
		return C.CString(errStr)
	}
	if fdata == nil {
		return C.CString("{\"data\": []")
	}
	fjson, err := fdata.JSON()
	if err != nil {
		return C.CString("{}")
	}
	return C.CString(fjson)
}

//export free_string
func free_string(str *C.char) {
	C.free(unsafe.Pointer(str))
}

func main() {}
