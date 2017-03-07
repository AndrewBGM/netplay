/// @description netplay_remove_event_handler
/// @param session
/// @param type
/// @param handler


var _session = argument[0],
    _type    = argument[1],
    _handler = argument[2];

var _event_handlers = _session[? "event_handlers"];

if ds_map_exists(_event_handlers, _type) {
    var _handlers = _event_handlers[? _type];
    
    var _index = ds_list_find_index(_handlers, _handler);
    
    if (_index >= 0) {
        ds_list_delete(_handlers, _index);
    }
}