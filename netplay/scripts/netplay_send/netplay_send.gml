/// @description netplay_send
/// @param id
/// @param socket
/// @param header
/// @param values[]


var _session = argument[0],
    _socket  = argument[1],
    _header  = argument[2],
    _values  = argument[3];


var _session_type            = _session[? __NETPLAY_SESSION_TYPE],
    _session_socket          = _session[? __NETPLAY_SESSION_SOCKET],
    _session_packets         = _session[? __NETPLAY_SESSION_PACKETS],
    _session_buffer          = _session[? __NETPLAY_SESSION_BUFFER],
    _session_event_handlers  = _session[? __NETPLAY_SESSION_EVENT_HANDLERS],
    _session_packet_handlers = _session[? __NETPLAY_SESSION_PACKET_HANDLERS],
    _session_header_type     = _session[? __NETPLAY_SESSION_HEADER_TYPE],
    _session_status          = _session[? __NETPLAY_SESSION_STATUS];

if (_session_status != NETPLAY_STATUS_CONNECTED) {
    var _packet_queue = _session[? __NETPLAY_SESSION_PACKET_QUEUE];
    
    if (_packet_queue == undefined) {
        _packet_queue = ds_list_create();
        
        ds_map_add_list(_session, __NETPLAY_SESSION_PACKET_QUEUE, _packet_queue);
    }

    ds_list_add(_packet_queue, [_socket, _header, _values]);

    return;
}

if (_session_socket == undefined) {
    show_debug_message("[NETPLAY] Cannot send packet to closed socket");
    
    return;
}

if (!ds_map_exists(_session_packets, _header)) {
    show_debug_message("[NETPLAY] Unknown packet header (" + string(_header) + ")");
    
    return;
}

var _types = _session_packets[? _header];

if (array_length_1d(_types) != array_length_1d(_values)) {
    show_debug_message("[NETPLAY] Incorrect number of arguments for packet header (" + string(_header) + ")");

    return;
}

var _packet_handlers = _session_packet_handlers[? NETPLAY_EVENT_SEND];

if (_packet_handlers != undefined) {
    _packet_handlers = _packet_handlers[? _header];
}

if (_packet_handlers != undefined) {
    for(var i = 0, j = ds_list_size(_packet_handlers);i < j;i ++) {
        var _handler = _packet_handlers[| i];
            
        var _pass = script_execute(_handler, _session, NETPLAY_EVENT_SEND, _socket, _header, _values);

        if (_pass == false) {
            break;
        }
    }
}

buffer_seek(_session_buffer, buffer_seek_start, 0);
buffer_write(_session_buffer, _session_header_type, _header);

for(var j = 0, l = array_length_1d(_types);j < l;j ++) {
    buffer_write(_session_buffer, _types[j], _values[j]);
}

// TODO: Make this overwritable, so middleware can send more / less data
var _buffer_pos = buffer_tell(_session_buffer);

var _event_handlers = _session_event_handlers[? NETPLAY_EVENT_SEND];

if (_event_handlers != undefined) {
    for(var m = 0, n = ds_list_size(_event_handlers);m < n;m ++) {
        var _handler = _event_handlers[| m];

        buffer_seek(_session_buffer, buffer_seek_start, 0);

        var _pass = script_execute(_handler, _session, NETPLAY_EVENT_SEND, _socket, _session_buffer);

        if (_pass == false) {
            break;
        }
    }
}

var _size = undefined;

switch(_session_type) {
    case NETPLAY_TYPE_TCP:
        _size = network_send_packet(_socket, _session_buffer, _buffer_pos);

        if (_size < 0) {
            show_debug_message("[NETPLAY] Failed to send packet header (" + string(_header) + ")");
        }
    break;
    
    default:
        show_error("[NETPLAY] Unsupported session type!", true);
    break;
}

return _size;