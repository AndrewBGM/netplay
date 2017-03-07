/// @description netplay_connect
/// @param host
/// @param port


var _host = argument[0],
    _port = argument[1];

var _socket = network_create_socket(network_socket_tcp),
    _server = network_connect(_socket, _host, _port);

if (_server < 0) {
    show_debug_message("[NETPLAY] Failed to connect to server " + string(_host) + ":" + string(_port));

    network_destroy(_socket);

    return undefined;
}

var _session = ds_map_create();

_session[? "host"] = _host;
_session[? "port"] = _port;

_session[? "socket"] = _socket;
_session[? "buffer"] = buffer_create(128, buffer_grow, 1);

_session[? "header_type"] = buffer_u8;

ds_map_add_map(_session, "packets", ds_map_create());
ds_map_add_map(_session, "packet_handlers", ds_map_create());
ds_map_add_map(_session, "event_handlers", ds_map_create());

return _session;