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