/// @description netplay_connect
/// @param host
/// @param port


var host = argument[0],
    port = argument[1];

var socket  = network_create_socket(network_socket_tcp),
    success = network_connect_raw(socket, host, port);

if (success < 0) {
    show_debug_message("[NETPLAY] Failed to connect to " + host + ":" + string(port));
    return undefined;
}

var session = ds_map_create();

session[? "is_server"] = false;

session[? "packet_type"] = buffer_u8;

session[? "connect_handler"]    = undefined;
session[? "data_handler"]       = undefined;
session[? "disconnect_handler"] = undefined;

session[? "host"]    = host;
session[? "port"]    = port;
session[? "socket"]  = socket;
session[? "buffer"]  = buffer_create(128, buffer_grow, 1);

session[? "clients"]  = undefined;
session[? "packets"]  = ds_list_create();
session[? "handlers"] = ds_list_create();

return session;