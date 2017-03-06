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

        var client_id = undefined;

        if (is_server) {
            var clients = session[? "clients"];

            for(var i = 0, j = ds_list_size(clients);i < j;i ++) {
                if (clients[| i] == undefined) {
                    clients[| i] = socket;
                    client_id = i;
                    break;
                }
            }

            if is_undefined(client_id) {
                client_id = ds_list_size(clients);
                ds_list_add(clients, socket);
            }
        }

        var handler = session[? "connect_handler"];

        if !is_undefined(handler) {
            script_execute(handler, session, ip, port, socket, client_id, success);
        }

        break;

    case network_type_disconnect:
        var socket  = async_load[? "socket"],
            success = async_load[? "success"];

        if (is_server) {
            var clients   = session[? "clients"],
                client_id = ds_list_find_index(clients, socket);

            if (client_id >= 0) {
                clients[| client_id] = undefined;
            }
        }

        var handler = session[? "disconnect_handler"];

        if !is_undefined(handler) {
            script_execute(handler, session, ip, port, socket, client_id, success);
        }

        break;

    case network_type_data:
        var buffer = async_load[? "buffer"],
            size   = async_load[? "size"];

        var client_id = undefined;

        var match = (_id == session[? "socket"]);
        if (!match && is_server) {
            var clients = session[? "clients"];

            for(var i = 0, j = ds_list_size(clients);i < j;i ++) {
                if (clients[| i] == _id) {
                    client_id = i;
                    match = true;
                    break;
                }
            }
        }

        if (!match) {
            return;
        }

        var packet_id = buffer_read(buffer, session[? "packet_type"]),
            types     = packets[| packet_id];

        if !is_array(types) {
            var handler = session[? "data_handler"];

            buffer_seek(buffer, buffer_seek_start, 0);

            if !is_undefined(handler) {
                script_execute(handler, session, _id, client_id, buffer);
            } else {
                show_debug_message("[NETPLAY] Unhandled packet ID: " + string(packet_id));
            }

            return;
        }

        var handler = handlers[| packet_id],
            count   = array_length_1d(types),
            params  = array_create(count, undefined);

        for(var k = 0;k < count;k ++) {
            params[k] = buffer_read(buffer, types[k]);
        }

        script_execute(handler, session, _id, client_id, packet_id, params);

        break;
}
