/// @description netplay_get_event_handler
/// @param session
/// @param type


var session = argument[0],
    type    = argument[1];

switch(type) {
    case network_type_connect:
        return session[? "connect_handler"];
    
    case network_type_disconnect:
        return session[? "disconnect_handler"];
        
    case network_type_data:
        return session[? "data_handler"];
}

return undefined;