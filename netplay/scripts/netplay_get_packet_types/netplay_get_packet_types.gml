/// @description netplay_get_packet_types
/// @param id
/// @param header


var _session = argument[0],
    _header  = argument[1];


var _session_packets = _session[? __NETPLAY_SESSION_PACKETS],
    _types           = _session_packets[? _header];

return _types;