/// @description netplay_is_remote
/// @param id


var _session = argument[0];


return (_session[? __NETPLAY_SESSION_REMOTE_SOCKETS] == undefined);