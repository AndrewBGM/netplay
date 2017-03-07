/// @description netplay_get_event_handlers
/// @param session
/// @param type

var _session = argument[0],
    _type    = argument[1];

var _event_handlers = _session[? "event_handlers"];

if ds_map_exists(_event_handlers, _type) {
    return _event_handlers[? _type];
}

return undefined;