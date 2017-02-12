/// @description netplay_get_client
/// @param session
/// @param uuid


var session = argument[0],
    uuid    = argument[1];

var clients = session[? "clients"];

return clients[| uuid];
