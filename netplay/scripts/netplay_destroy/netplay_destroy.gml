/// @description netplay_destroy
/// @param session


var _session = argument[0];

buffer_delete(_session[? "buffer"]);

ds_map_destroy(_session);