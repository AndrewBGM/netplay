/// @description netplay_get_packet_handler
/// @param session
/// @param uuid


var session = argument[0],
    uuid    = argument[1];

var handlers = session[? "handlers"];
return handlers[| uuid];
