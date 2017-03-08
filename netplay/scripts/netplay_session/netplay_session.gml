/// @description netplay_session


var _session = ds_map_create();

_session[? "host"] = undefined;
_session[? "port"] = undefined;

_session[? "socket"] = undefined;
_session[? "buffer"] = buffer_create(128, buffer_grow, 1);

_session[? "header_type"] = buffer_u8;

ds_map_add_map(_session, "packets", ds_map_create());
ds_map_add_map(_session, "packet_handlers", ds_map_create());
ds_map_add_map(_session, "event_handlers", ds_map_create());

return _session;