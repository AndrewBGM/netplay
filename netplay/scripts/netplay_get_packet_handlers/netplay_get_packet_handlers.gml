/// @description netplay_get_packet_handlers
/// @param session
/// @param id

var _session = argument[0],
    _id      = argument[1];

var _packet_handlers = _session[? "packet_handlers"];

if ds_map_exists(_packet_handlers, _id) {
    return _packet_handlers[? _id];
}

return undefined;