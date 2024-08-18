function set_tunnel(this, x_, y_, value){
	with (this) {
		var index = (y_ * grid_size + x_) * 2
		buffer_seek(tunnel_buffer, buffer_seek_start, index)
		buffer_write(tunnel_buffer, buffer_f16, value)
	}
}