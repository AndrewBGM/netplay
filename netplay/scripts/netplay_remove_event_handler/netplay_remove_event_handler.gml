/// @description netplay_remove_event_handler
/// @param id
/// @param event
/// @param script


var _session = argument[0],
    _event   = argument[1],
    _script  = argument[2];


var _session_event_handlers = _session[? __NETPLAY_SESSION_EVENT_HANDLERS],
    _event_handlers         = _session_event_handlers[? _event];

if (_event_handlers == undefined) {
    return;
}

var _index = ds_list_find_index(_event_handlers, _script);

if (_index >= 0) {
    ds_list_delete(_event_handlers, _index);
}