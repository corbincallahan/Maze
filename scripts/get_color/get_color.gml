function get_color(this, x_, y_){
	with (this) {
		var index = (y_ * grid_size + x_) * 2
		buffer_seek(color_buffer, buffer_seek_start, index)
		return buffer_read(color_buffer, buffer_f16)
	}
}