/// @description netplay_set_event_handler
/// @param session
/// @param type
/// @param handler


var session = argument[0],
    type    = argument[1],
    handler = argument[2];

switch(type) {
    case network_type_connect:
        session[? "connect_handler"] = handler;
        
        break;
    
    case network_type_disconnect:
        session[? "disconnect_handler"] = handler;
        
        break;
        
    case network_type_data:
        session[? "data_handler"] = handler;
        
        break;
}