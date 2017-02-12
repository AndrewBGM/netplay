/// @description netplay_set_packet_handler
/// @param session
/// @param uuid
/// @param handler


var session = argument[0],
    uuid    = argument[1],
    handler = argument[2];

var handlers = session[? "handlers"];
handlers[| uuid] = handler;
