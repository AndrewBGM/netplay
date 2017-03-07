/// @description netplay_remove_packet
/// @param session
/// @param id


var _session   = argument[0],
    _id        = argument[1];

var _packets = _session[? "packets"];

if ds_map_exists(_packets, _id) {
    ds_map_delete(_packets, _id);
}