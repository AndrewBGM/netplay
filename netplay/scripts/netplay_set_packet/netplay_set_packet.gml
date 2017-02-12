/// @description netplay_set_packet
/// @param session
/// @param uuid
/// @param types...


var session = argument[0],
    uuid    = argument[1],
    types   = argument[2];

if !is_array(types) {
    types = array_create(argument_count - 2, undefined);
    
    for(var i = 2;i < argument_count;i ++) {
        types[i - 2] = argument[i];
    }
}

var packets = session[? "packets"];
packets[| uuid] = types;
