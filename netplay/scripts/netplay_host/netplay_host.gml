/// @description netplay_host
/// @param id
/// @param port
/// @param maxclients


var _session    = argument[0],
    _port       = argument[1],
    _maxclients = argument[2];


ds_map_add_map(_session, __NETPLAY_SESSION_REMOTE_SOCKETS, ds_map_create());

var _session_type = _session[? __NETPLAY_SESSION_TYPE];

switch(_session_type) {
    case NETPLAY_TYPE_TCP:
        _session_type = network_socket_tcp;
    break;
    
    default:
        show_error("[NETPLAY] Unsupported session type!", true);
    break;
}

var _socket = network_create_server(_session_type, _port, _maxclients);

if (_socket < 0) {
    show_debug_message("[NETPLAY] Failed to start server on port " + string(_port));
    
    network_destroy(_socket);
    
    _session[? __NETPLAY_SESSION_STATUS] = NETPLAY_STATUS_ERROR;
    
    return _socket;
}

_session[? __NETPLAY_SESSION_HOST]   = -1;
_session[? __NETPLAY_SESSION_PORT]   = _port;
_session[? __NETPLAY_SESSION_SOCKET] = _socket;
_session[? __NETPLAY_SESSION_STATUS] = NETPLAY_STATUS_CONNECTED;

return _socket;