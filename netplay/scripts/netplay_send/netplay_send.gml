/// @description netplay_send
/// @param session
/// @param socket
/// @param packet_id
/// @param values...


var _session   = argument[0],
    _socket    = argument[1],
    _packet_id = argument[2],
    _values    = array_create(argument_count - 3, undefined);

if (_session[? "socket"] == undefined) {
    show_debug_message("[NETPLAY] Cannot send packet to closed socket");

    return undefined;
}

for(var i = 3;i < argument_count;i ++) {
    _values[i - 3] = argument[i];
}

var _packets = _session[? "packets"];

if !ds_map_exists(_packets, _packet_id) {
    show_debug_message("[NETPLAY] Unknown packet ID (" + string(_packet_id) + ")");

    return undefined;
}

var _packet_types = _packets[? _packet_id];

if (array_length_1d(_packet_types) != array_length_1d(_values)) {
    show_debug_message("[NETPLAY] Incorrect number of arguments for packet ID (" + string(_packet_id) + ")");

    return undefined;
}

var _buffer = _session[? "buffer"];

buffer_seek(_buffer, buffer_seek_start, 0);
buffer_write(_buffer, _session[? "header_type"], _packet_id);

for(var j = 0, l = array_length_1d(_packet_types);j < l;j ++) {
    buffer_write(_buffer, _packet_types[j], _values[j]);
}

var _size = network_send_packet(_socket, _buffer, buffer_tell(_buffer));

if (_size < 0) {
    show_debug_message("[NETPLAY] Failed to send packet ID (" + string(_packet_id) + ")");
}

return _size;