/// @description netplay_open
/// @param port
/// @param maxclients


var port       = argument[0],
    maxclients = argument[1];

var socket = network_create_server_raw(network_socket_tcp, port, maxclients);

if (socket < 0) {
    show_debug_message("[NETPLAY] Failed to listen on port " + string(port));
    return undefined;
}

var session = ds_map_create();

session[? "is_server"] = true;

session[? "packet_type"] = buffer_u8;

session[? "connect_handler"]    = undefined;
session[? "data_handler"]       = undefined;
session[? "disconnect_handler"] = undefined;

session[? "host"]    = "self";
session[? "port"]    = port;
session[? "socket"]  = socket;
session[? "buffer"]  = buffer_create(128, buffer_grow, 1);

session[? "clients"]  = ds_list_create();
session[? "packets"]  = ds_list_create();
session[? "handlers"] = ds_list_create();

return session;