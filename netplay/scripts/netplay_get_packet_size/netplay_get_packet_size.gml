/// @description netplay_get_packet_size
/// @param session


var session = argument[0];

return buffer_get_size(session[? "buffer"]);