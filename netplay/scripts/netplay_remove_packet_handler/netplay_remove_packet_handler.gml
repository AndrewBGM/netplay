/// @description netplay_remove_packet_handler
/// @param session
/// @param id
/// @param handler


var _session = argument[0],
    _id      = argument[1],
    _handler = argument[2];

var _packet_handlers = _session[? "packet_handlers"];

if ds_map_exists(_packet_handlers, _id) {
    var _handlers = _packet_handlers[? _id];
    
    var _index = ds_list_find_index(_handlers, _handler);
    
    if (_index >= 0) {
        ds_list_delete(_handlers, _index);
    }
}