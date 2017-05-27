/// @description netplay_remove_packet_handler
/// @param id
/// @param event
/// @param header
/// @param script


var _session = argument[0],
    _event   = argument[1],
    _header  = argument[2],
    _script  = arguemnt[3];


var _session_packet_handlers = _session[? __NETPLAY_SESSION_PACKET_HANDLERS],
    _packet_event_handlers   = _session_packet_handlers[? _event];

if (_packet_event_handlers == undefined) {
    return;
}

var _packet_handlers = _packet_event_handlers[? _header];

if (_packet_handlers == undefined) {
    return;
}

var _index = ds_list_find_index(_packet_handlers, _script);

if (_index < 0) {
    return;
}

ds_list_delete(_packet_handlers, _index);