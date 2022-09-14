target("usb") do
	set_kind("static")
	add_files("libusb/libusb/*.c")
	add_files("libusb/libusb/os/*_posix.c")
	add_files("libusb/libusb/os/linux_usbfs.c")
	add_includedirs("libusb/libusb",{public=true})
	add_includedirs("libusb/android",{public=true})
	add_cxflags("-mno-outline-atomics")
end

target("ftdi1") do
	set_kind("static")
	add_deps("usb")
	add_files("libftdi/src/*.c")
	add_includedirs("libftdi/src",{public=true})
end
