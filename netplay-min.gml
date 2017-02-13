#define netplay_is_server
/// @description netplay_is_server
/// @param session


var session = argument[0];

return session[? "is_server"];


#define netplay_get_packet_size
/// @description netplay_get_packet_size
/// @param session


var session = argument[0];

return buffer_get_size(session[? "buffer"]);

#define netplay_get_host
/// @description netplay_get_host
/// @param session


var session = argument[0];

return session[? "host"];


#define netplay_set_packet
/// @description netplay_set_packet
/// @param session
/// @param uuid
/// @param types...


var session = argument[0],
    uuid    = argument[1],
    types   = argument[2];

if !is_array(types) {
    types = array_create(argument_count - 2, undefined);
    
    for(var i = 2;i < argument_count;i ++) {
        types[i - 2] = argument[i];
    }
}

var packets = session[? "packets"];
packets[| uuid] = types;


#define netplay_get_packet
/// @description netplay_get_packet
/// @param session
/// @param uuid


var session = argument[0],
    uuid    = argument[1];

var packets = session[? "packets"];
return packets[| uuid];

#define netplay_destroy
/// @description netplay_destroy
/// @param session


var session = argument[0];

if !ds_exists(session, ds_type_map) {
    return;
}

network_destroy(session[? "socket"]);

buffer_delete(session[? "buffer"]);

if !is_undefined(session[? "clients"]) {
    ds_list_destroy(session[? "clients"]);
}

ds_list_destroy(session[? "packets"]);
ds_list_destroy(session[? "handlers"]);

ds_map_destroy(session);

#define netplay_get_packets
/// @description netplay_get_packets
/// @param session


var session = argument[0];

return session[? "packets"];


#define netplay_get_packet_handlers
/// @description netplay_get_packet_handlers
/// @param session


var session = argument[0];

return session[? "handlers"];


#define netplay_get_port
/// @description netplay_get_port
/// @param session


var session = argument[0];

return session[? "port"];


#define netplay_set_packet_size
/// @description netplay_set_packet_size
/// @param session
/// @param size


var session = argument[0],
    size    = argument[1];

buffer_resize(session[? "buffer"], size);

#define netplay_get_clients
/// @description netplay_get_clients
/// @param session


var session = argument[0];

return session[? "clients"];


#define netplay_connect
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

#define netplay_get_socket
/// @description netplay_get_socket
/// @param session


var session = argument[0];

return session[? "socket"];


#define netplay_get_buffer
/// @description netplay_get_buffer
/// @param session


var session = argument[0];

return session[? "buffer"];


#define netplay_set_packet_type
/// @description netplay_set_packet_type
/// @param session
/// @param type


var session = argument[0],
    type    = argument[1];

session[? "packet_type"] = type;

#define netplay_send
/// @description netplay_send
/// @param session
/// @param target
/// @param uuid
/// @param params...


var session = argument[0],
    target  = argument[1],
    uuid    = argument[2],
    params  = argument[3];

if !is_array(argument[3]) {
    params = array_create(argument_count - 3, undefined);
    
    for(var i = 3;i < argument_count;i ++) {
        params[i - 3] = argument[i];
    }
}

var packets = session[? "packets"],
    types   = packets[| uuid];

if is_undefined(types) {
    show_debug_message("[NETPLAY] Unknown packet UUID: " + string(uuid));
    return;
}

var buffer = session[? "buffer"];
buffer_seek(buffer, buffer_seek_start, 0);

buffer_write(buffer, session[? "packet_type"], uuid);
for(var i = 0, j = array_length_1d(types);i < j;i ++) {
    buffer_write(buffer, types[@ i], params[@ i]);
}

if (!session[? "is_server"]) {
    target = session[? "socket"];
}

var res = network_send_raw(target, buffer, buffer_tell(buffer));
if (res < 0) {
    show_debug_message("[NETPLAY] Failed to send packet UUID: " + string(uuid));
}

return res;


#define netplay_get_client
/// @description netplay_get_client
/// @param session
/// @param uuid


var session = argument[0],
    uuid    = argument[1];

var clients = session[? "clients"];

return clients[| uuid];


#define netplay_set_event_handler
/// @description netplay_set_event_handler
/// @param session
/// @param type
/// @param handler


var session = argument[0],
    type    = argument[1],
    handler = argument[2];

switch(type) {
    case network_type_connect:
        session[? "connect_handler"] = handler;
        
        break;
    
    case network_type_disconnect:
        session[? "disconnect_handler"] = handler;
        
        break;
        
    case network_type_data:
        session[? "data_handler"] = handler;
        
        break;
}

#define netplay_get_event_handler
/// @description netplay_get_event_handler
/// @param session
/// @param type


var session = argument[0],
    type    = argument[1];

switch(type) {
    case network_type_connect:
        return session[? "connect_handler"];
    
    case network_type_disconnect:
        return session[? "disconnect_handler"];
        
    case network_type_data:
        return session[? "data_handler"];
}

return undefined;

#define netplay_set_packet_handler
/// @description netplay_set_packet_handler
/// @param session
/// @param uuid
/// @param handler


var session = argument[0],
    uuid    = argument[1],
    handler = argument[2];

var handlers = session[? "handlers"];
handlers[| uuid] = handler;


#define netplay_get_packet_type
/// @description netplay_get_packet_type
/// @param session


var session = argument[0];

return session[? "packet_type"];

#define netplay_async
/// @description netplay_async
/// @param session


var session = argument[0];

if !ds_exists(session, ds_type_map) {
    return;
}

var type = async_load[? "type"],
    _id  = async_load[? "id"],
    ip   = async_load[? "ip"],
    port = async_load[? "port"];

var packets  = session[? "packets"],
    handlers = session[? "handlers"];

var is_server = session[? "is_server"];

switch(type) {
    case network_type_connect:
        var socket  = async_load[? "socket"],
            success = async_load[? "success"];

        var uuid = undefined;

        if (is_server) {
            var clients = session[? "clients"];

            for(var i = 0, j = ds_list_size(clients);i < j;i ++) {
                if (clients[| i] == undefined) {
                    clients[| i] = socket;
                    uuid = i;
                    break;
                }
            }

            if is_undefined(uuid) {
                uuid = ds_list_size(clients);
                ds_list_add(clients, socket);
            }
        }

        var handler = session[? "connect_handler"];

        if !is_undefined(handler) {
            script_execute(handler, session, ip, port, socket, uuid, success);
        }

        break;

    case network_type_disconnect:
        var socket  = async_load[? "socket"],
            success = async_load[? "success"];

        if (is_server) {
            var clients = session[? "clients"],
                uuid    = ds_list_find_index(clients, socket);

            if (uuid >= 0) {
                clients[| uuid] = undefined;
            }
        }

        var handler = session[? "disconnect_handler"];

        if !is_undefined(handler) {
            script_execute(handler, session, ip, port, socket, uuid, success);
        }

        break;

    case network_type_data:
        var buffer = async_load[? "buffer"],
            size   = async_load[? "size"];

        var uuid = undefined;

        var match = (_id == session[? "socket"]);
        if (!match && is_server) {
            var clients = session[? "clients"];

            for(var i = 0, j = ds_list_size(clients);i < j;i ++) {
                if (clients[| i] == _id) {
                    uuid = i;
                    match = true;
                    break;
                }
            }
        }

        if (!match) {
            return;
        }

        var packet_type = buffer_read(buffer, session[? "packet_type"]),
            types       = packets[| packet_type];

        if !is_array(types) {
            var handler = session[? "data_handler"];

            buffer_seek(buffer, buffer_seek_start, 0);

            if !is_undefined(handler) {
                script_execute(handler, session, _id, uuid, buffer);
            } else {
                show_debug_message("[NETPLAY] Unhandled packet UUID: " + string(packet_type));
            }

            return;
        }

        var handler = handlers[| packet_type],
            count   = array_length_1d(types),
            params  = array_create(count, undefined);

        for(var k = 0;k < count;k ++) {
            params[k] = buffer_read(buffer, types[k]);
        }

        script_execute(handler, session, _id, uuid, packet_type, params);

        break;
}


#define netplay_open
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

#define netplay_get_packet_handler
/// @description netplay_get_packet_handler
/// @param session
/// @param uuid


var session = argument[0],
    uuid    = argument[1];

var handlers = session[? "handlers"];
return handlers[| uuid];


