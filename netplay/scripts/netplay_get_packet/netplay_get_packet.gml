/// @description netplay_get_packet
/// @param session
/// @param packet_id


var session   = argument[0],
    packet_id = argument[1];

var packets = session[? "packets"];
return packets[| packet_id];