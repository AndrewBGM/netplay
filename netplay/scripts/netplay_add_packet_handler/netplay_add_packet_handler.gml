/// @description netplay_add_packet_handler
/// @param id
/// @param event
/// @param header
/// @param script


var _session = argument[0],
    _event   = argument[1],
    _header  = argument[2],
    _script  = argument[3];


var _session_packet_handlers = _session[? __NETPLAY_SESSION_PACKET_HANDLERS],
    _packet_event_handlers   = _session_packet_handlers[? _event];

if (_packet_event_handlers == undefined) {
    _packet_event_handlers = ds_map_create();
    
    ds_map_add_map(_session_packet_handlers, _event, _packet_event_handlers);
}

var _packet_handlers = _packet_event_handlers[? _header];

if (_packet_handlers == undefined) {
    _packet_handlers = ds_list_create();
    
    ds_map_add_list(_packet_event_handlers, _header, _packet_handlers);
}

var _index = ds_list_find_index(_packet_handlers, _script);

if (_index < 0) {
    ds_list_add(_packet_handlers, _script);
}