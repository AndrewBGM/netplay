/// @description netplay_get_packet_handlers
/// @param id
/// @param event
/// @param header


var _session = argument[0],
    _event   = argument[1],
    _header  = argument[2];


var _session_packet_handlers = _session[? __NETPLAY_SESSION_PACKET_HANDLERS],
    _packet_event_handlers   = _session_packet_handlers[? _event];

if (_packet_event_handlers == undefined) {
    return;
}

var _packet_handlers = _packet_event_handlers[? _header];

if (_packet_handlers == undefined) {
    return;
}

var _count  = ds_list_size(_packet_handlers),
    _result = array_create(_count, undefined);

for(var i = 0;i < _count;i ++) {
    _result[i] = _packet_handlers[| i];
}

return _result;