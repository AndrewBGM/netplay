/// @description netplay_add_packet
/// @param id
/// @param header
/// @param types[]


var _session = argument[0],
    _header  = argument[1],
    _types   = argument[2];


var _session_packets = _session[? __NETPLAY_SESSION_PACKETS];

_session_packets[? _header] = _types;