/// @description netplay_set_header_type
/// @param id
/// @param type


var _session = argument[0],
    _type    = argument[1];


_session[? __NETPLAY_SESSION_HEADER_TYPE] = _type;