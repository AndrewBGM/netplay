/// @description netplay_destroy
/// @param id


var _session = argument[0];


var _session_socket = _session[? __NETPLAY_SESSION_SOCKET],
    _session_buffer = _session[? __NETPLAY_SESSION_BUFFER];

if (_session_socket != undefined) {
    netplay_close(_session, _session_socket);
}

buffer_delete(_session_buffer);

ds_map_destroy(_session);