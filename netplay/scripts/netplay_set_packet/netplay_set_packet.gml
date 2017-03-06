/// @description netplay_set_packet
/// @param session
/// @param packet_id
/// @param types...


var session   = argument[0],
    packet_id = argument[1],
    types     = argument[2];

if !is_array(types) {
    types = array_create(argument_count - 2, undefined);
    
    for(var i = 2;i < argument_count;i ++) {
        types[i - 2] = argument[i];
    }
}

var packets = session[? "packets"];
packets[| packet_id] = types;
