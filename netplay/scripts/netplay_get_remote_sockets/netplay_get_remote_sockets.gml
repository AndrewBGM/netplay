/// @description netplay_get_remote_sockets
/// @param id


var _session = argument[0];


var _remote_sockets = _session[? __NETPLAY_SESSION_REMOTE_SOCKETS];

if (_remote_sockets == undefined) {
    return undefined;
}

var _count  = ds_map_size(_remote_sockets),
    _result = array_create(_count, undefined),
    _index  = 0;

for(var key = ds_map_find_first(_remote_sockets);key != undefined;key = ds_map_find_next(_remote_sockets, key)) {
    _result[_index++] = _key;
}

return _result;