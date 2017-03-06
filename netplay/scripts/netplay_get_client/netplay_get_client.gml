/// @description netplay_get_client
/// @param session
/// @param client_id


var session   = argument[0],
    client_id = argument[1];

var clients = session[? "clients"];

return clients[| client_id];
