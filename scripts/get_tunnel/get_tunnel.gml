function get_tunnel(this, x_, y_){
	with (this) {
		var index = (y_ * grid_size + x_) * 2
		buffer_seek(tunnel_buffer, buffer_seek_start, index)
		return buffer_read(tunnel_buffer, buffer_f16)
	}
}