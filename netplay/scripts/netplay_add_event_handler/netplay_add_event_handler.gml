/// @description netplay_add_event_handler
/// @param id
/// @param event
/// @param script


var _session = argument[0],
    _event   = argument[1],
    _script  = argument[2];


var _session_event_handlers = _session[? __NETPLAY_SESSION_EVENT_HANDLERS],
    _event_handlers         = _session_event_handlers[? _event];

if (_event_handlers == undefined) {
    _event_handlers = ds_list_create();
    
    ds_map_add_list(_session_event_handlers, _event, _event_handlers);
}

ds_list_add(_event_handlers, _script);