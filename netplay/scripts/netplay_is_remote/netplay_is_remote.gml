/// @description netplay_is_remote
/// @param session


var _session = argument[0];

return _session[? "host"] != "self";