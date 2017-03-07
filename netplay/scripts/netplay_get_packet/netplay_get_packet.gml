/// @description netplay_get_packet
/// @param session
/// @param id


var _session   = argument[0],
    _id        = argument[1];

var _packets = _session[? "packets"];

if !ds_map_exists(_packets, _id) {
    return undefined;
}

return _packets[? _id];