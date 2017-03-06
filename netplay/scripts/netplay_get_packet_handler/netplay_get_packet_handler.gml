/// @description netplay_get_packet_handler
/// @param session
/// @param packet_id


var session   = argument[0],
    packet_id = argument[1];

var handlers = session[? "handlers"];
return handlers[| packet_id];
