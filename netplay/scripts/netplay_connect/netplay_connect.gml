/// @description netplay_connect
/// @param session
/// @param host
/// @param port


var _session = argument[0],
    _host    = argument[1],
    _port    = argument[2];

var _socket = network_create_socket(network_socket_tcp),
    _server = network_connect(_socket, _host, _port);

if (_server < 0) {
    show_debug_message("[NETPLAY] Failed to connect to server " + string(_host) + ":" + string(_port));

    network_destroy(_socket);

    return undefined;
}

_session[? "host"] = _host;
_session[? "port"] = _port;

_session[? "socket"] = _socket;

return _socket;