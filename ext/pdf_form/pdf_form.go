package main
import "C"

//export get_form_data
func get_form_data(_data *C.char) int {
	return 2
}

func main() {}
