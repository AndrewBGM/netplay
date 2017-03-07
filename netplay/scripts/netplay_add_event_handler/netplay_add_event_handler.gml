/// @description netplay_add_event_handler
/// @param session
/// @param type
/// @param handler


var _session = argument[0],
    _type    = argument[1],
    _handler = argument[2];

var _event_handlers = _session[? "event_handlers"];

if !ds_map_exists(_event_handlers, _type) {
    ds_map_add_list(_event_handlers, _type, ds_list_create());
}

var _handlers = _event_handlers[? _type];

ds_list_add(_handlers, _handler);