/// @description netplay_set_packet_handler
/// @param session
/// @param packet_id
/// @param handler


var session   = argument[0],
    packet_id = argument[1],
    handler   = argument[2];

var handlers = session[? "handlers"];
handlers[| packet_id] = handler;
