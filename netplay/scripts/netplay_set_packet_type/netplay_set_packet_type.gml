/// @description netplay_set_packet_type
/// @param session
/// @param type


var session = argument[0],
    type    = argument[1];

session[? "packet_type"] = type;