function set_color(this, x_, y_, value){
	with (this) {
		var index = (y_ * grid_size + x_) * 2
		buffer_seek(color_buffer, buffer_seek_start, index)
		buffer_write(color_buffer, buffer_f16, value)
	}
}