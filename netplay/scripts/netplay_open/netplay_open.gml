/// @description netplay_open
/// @param session
/// @param port
/// @param maxclients


var _session    = argument[0],
    _port       = argument[1],
    _maxclients = argument[2];

var _socket = network_create_server(network_socket_tcp, _port, _maxclients);

if (_socket < 0) {
    show_debug_message("[NETPLAY] Failed to start server on port " + string(_port));

    network_destroy(_socket);

    return _socket;
}

_session[? "host"] = "self";
_session[? "port"] = _port;

_session[? "socket"] = _socket;

ds_map_add_list(_session, "remote_sockets", ds_list_create());

return _socket;