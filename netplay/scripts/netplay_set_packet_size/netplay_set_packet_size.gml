/// @description netplay_set_packet_size
/// @param session
/// @param size


var session = argument[0],
    size    = argument[1];

buffer_resize(session[? "buffer"], size);