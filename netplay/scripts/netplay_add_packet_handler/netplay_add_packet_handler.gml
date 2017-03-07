/// @description netplay_add_packet_handler
/// @param session
/// @param id
/// @param handler


var _session = argument[0],
    _id      = argument[1],
    _handler = argument[2];

var _packet_handlers = _session[? "packet_handlers"];

if !ds_map_exists(_packet_handlers, _id) {
    ds_map_add_list(_packet_handlers, _id, ds_list_create());
}

var _handlers = _packet_handlers[? _id];

ds_list_add(_handlers, _handler)