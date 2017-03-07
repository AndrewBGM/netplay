/// example_increment_server_handler(session, socket, ip, port, packet_id, values);

var _session   = argument[0],
    _socket    = argument[1],
    _ip        = argument[2],
    _port      = argument[3],
    _packet_id = argument[4],
    _values    = argument[5];

var _num = _values[0];

show_debug_message("Server received: " + string(_num));

netplay_send(_session, _socket, _packet_id, _num + 1);