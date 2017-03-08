/// @description netplay_destroy
/// @param session


var _session = argument[0];

if (_session[? "socket"] != undefined) {
    network_destroy(_session[? "socket"]);
}

buffer_delete(_session[? "buffer"]);

ds_map_destroy(_session);