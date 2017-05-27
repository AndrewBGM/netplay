/// @description netplay_get_socket_port
/// @param id
/// @param socket


var _session = argument[0],
    _socket  = argument[1];


var _is_remote = (_session_remote_sockets == undefined);

if (_is_remote) {
    return undefined;
}

var _session_remote_sockets = _session[? __NETPLAY_SESSION_REMOTE_SOCKETS],
    _socket_data            = _session_remote_sockets[? _socket];

if (_socket_data == undefined) {
    return undefined;
}

return _socket_data[1];