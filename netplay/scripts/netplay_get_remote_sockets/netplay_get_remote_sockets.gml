/// @description netplay_get_remote_sockets
/// @param session


var _session = argument[0];

if netplay_is_remote(_session) {
    return undefined;
}

return _session[? "remote_sockets"];