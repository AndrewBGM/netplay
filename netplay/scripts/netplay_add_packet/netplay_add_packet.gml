/// @description netplay_add_packet
/// @param session
/// @param id
/// @param types...


var _session   = argument[0],
    _id        = argument[1],
    _types     = array_create(argument_count - 2, undefined);

for(var i = 2;i < argument_count;i ++) {
    _types[i - 2] = argument[i];
}

var _packets = _session[? "packets"];

_packets[? _id] = _types;