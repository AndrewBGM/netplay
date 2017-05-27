/// @description netplay_get_packets
/// @param id


var _session = argument[0];


var _session_packets = _session[? __NETPLAY_SESSION_PACKETS];

var _count  = ds_map_size(_session_packets),
    _result = array_create(_count, undefined),
    _index  = 0;

for(var header = ds_map_find_first(_session_packets);header != undefined;header = ds_map_find_next(_session_packets, header)) {
    _result[_index++] = header;
}

return _result;
