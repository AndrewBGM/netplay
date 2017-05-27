/// scr_handle_echo_client(session, event, socket, header, values[]);


var _session = argument[0],
    _event   = argument[1],
    _socket  = argument[2],
    _header  = argument[3],
    _values  = argument[4];


switch(_event) {
    case NETPLAY_EVENT_SEND:
        show_debug_message("Client sending echo packet...");
    break;

    case NETPLAY_EVENT_RECV:
        show_debug_message("Client received: " + _values[0]);
    break;
}