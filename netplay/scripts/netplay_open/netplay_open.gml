/// @description netplay_open
/// @param port
/// @param maxclients


var _port       = argument[0],
    _maxclients = argument[1];

var _socket = network_create_server(network_socket_tcp, _port, _maxclients);

if (_socket < 0) {
    show_debug_message("[NETPLAY] Failed to start server on port " + string(_port));

    network_destroy(_socket);

    return undefined;
}

var _session = ds_map_create();

_session[? "host"] = "self";
_session[? "port"] = _port;

_session[? "socket"] = _socket;
_session[? "buffer"] = buffer_create(128, buffer_grow, 1);

_session[? "header_type"] = buffer_u8;

ds_map_add_map(_session, "packets", ds_map_create());
ds_map_add_map(_session, "packet_handlers", ds_map_create());
ds_map_add_map(_session, "event_handlers", ds_map_create());

ds_map_add_list(_session, "remote_sockets", ds_list_create());

return _session;