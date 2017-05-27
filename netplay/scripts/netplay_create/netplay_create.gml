/// @description netplay_create
/// @param type


var _type = argument[0];


var _session = ds_map_create();

_session[? __NETPLAY_SESSION_TYPE]        = _type;
_session[? __NETPLAY_SESSION_STATUS]      = NETPLAY_STATUS_UNKNOWN;
_session[? __NETPLAY_SESSION_BUFFER]      = buffer_create(128, buffer_grow, 1);
_session[? __NETPLAY_SESSION_HEADER_TYPE] = buffer_u8;

ds_map_add_map(_session, __NETPLAY_SESSION_PACKETS,         ds_map_create());
ds_map_add_map(_session, __NETPLAY_SESSION_PACKET_HANDLERS, ds_map_create());
ds_map_add_map(_session, __NETPLAY_SESSION_EVENT_HANDLERS,  ds_map_create());

return _session;