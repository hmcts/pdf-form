package main
// #include <stdlib.h>
import "C"
import "unsafe"

//export get_form_data
func get_form_data(_data *C.char) *C.char {
	return C.CString("Hello World")
}

//export free_string
func free_string(str *C.char) {
	C.free(unsafe.Pointer(str))
}

func main() {}
