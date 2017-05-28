/// @description netplay_join
/// @param id
/// @param host
/// @param port
/// @param [timeout]


var _session = argument[0],
    _host    = argument[1],
    _port    = argument[2],
    _timeout = (argument_count > 3) ? argument[3] : undefined;


if (_timeout != undefined) {
    network_set_config(network_config_connect_timeout, _timeout);
}

var _session_type = _session[? __NETPLAY_SESSION_TYPE],
    _socket       = undefined;

switch(_session_type) {
    case NETPLAY_TYPE_TCP:
        _socket = network_create_socket(network_socket_tcp);
        
        var _status = network_connect(_socket, _host, _port);

        if (_status < 0) {
            show_debug_message("[NETPLAY] Failed to connect to server " + string(_host) + ":" + string(_port));

            network_destroy(_socket);
    
            _session[? __NETPLAY_SESSION_STATUS] = NETPLAY_STATUS_ERROR;

            return _status;
        }
    break;
    
    default:
        show_error("[NETPLAY] Unsupported session type!", true);
    break;
}

_session[? __NETPLAY_SESSION_HOST]   = _host;
_session[? __NETPLAY_SESSION_PORT]   = _port;
_session[? __NETPLAY_SESSION_SOCKET] = _socket;
_session[? __NETPLAY_SESSION_STATUS] = NETPLAY_STATUS_PENDING;

return _socket;