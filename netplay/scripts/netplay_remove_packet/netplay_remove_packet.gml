/// @description netplay_remove_packet
/// @param id
/// @param header


var _session = argument[0],
    _header  = argument[1];


var _session_packets = _session[? __NETPLAY_SESSION_PACKETS];

ds_map_delete(_session_packets, _header);