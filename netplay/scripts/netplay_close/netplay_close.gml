/// @description netplay_close
/// @param id
/// @param socket


var _session = argument[0],
    _socket  = argument[1];


var _session_event_handlers = _session[? __NETPLAY_SESSION_EVENT_HANDLERS]

var _event_handlers = _session_event_handlers[? NETPLAY_EVENT_DISCONNECT];
        
if (_event_handlers != undefined) {
    for(var i = 0, j = ds_list_size(_event_handlers);i < j;i ++) {
        var _handler = _event_handlers[| i];
            
        var _pass = script_execute(_handler, _session, NETPLAY_EVENT_DISCONNECT, _socket);
            
        if (_pass == false) {
            break;
        }
    }
}

var _session_remote_sockets = _session[? __NETPLAY_SESSION_REMOTE_SOCKETS];

if (_session_remote_sockets != undefined) {
    if ds_map_exists(_session_remote_sockets, _socket) {
        ds_map_delete(_session_remote_sockets, _socket);
    }
}

network_destroy(_socket);