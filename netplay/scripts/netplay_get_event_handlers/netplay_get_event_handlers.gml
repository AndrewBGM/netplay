/// @description netplay_get_event_handlers
/// @param id
/// @param event


var _session = argument[0],
    _event   = argument[1];


var _session_event_handlers = _session[? __NETPLAY_SESSION_EVENT_HANDLERS],
    _event_handlers         = _session_event_handlers[? _event];

if (_event_handlers == undefined) {
    return undefined;
}

var _count  = ds_list_size(_event_handlers),
    _result = array_create(_count, undefined);

for(var i = 0;i < _count;i ++) {
    _result[i] = _event_handlers[| i];
}

return _result;