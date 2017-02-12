/// @description netplay_get_packet
/// @param session
/// @param uuid


var session = argument[0],
    uuid    = argument[1];

var packets = session[? "packets"];
return packets[| uuid];