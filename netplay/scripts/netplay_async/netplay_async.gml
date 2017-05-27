/// @description netplay_async
/// @param id


var _session = argument[0];


var _session_socket          = _session[? __NETPLAY_SESSION_SOCKET],
    _session_packets         = _session[? __NETPLAY_SESSION_PACKETS],
    _session_header_type     = _session[? __NETPLAY_SESSION_HEADER_TYPE],
    _session_packet_handlers = _session[? __NETPLAY_SESSION_PACKET_HANDLERS],
    _session_event_handlers  = _session[? __NETPLAY_SESSION_EVENT_HANDLERS],
    _session_remote_sockets  = _session[? __NETPLAY_SESSION_REMOTE_SOCKETS],
    _session_packet_queue    = _session[? __NETPLAY_SESSION_PACKET_QUEUE];

if (_session_socket == undefined) {
    return;
}

var _async_type = async_load[? "type"],
    _async_id   = async_load[? "id"],
    _async_ip   = async_load[? "ip"],
    _async_port = async_load[? "port"];

switch(_async_type) {
    case network_type_non_blocking_connect:
        var _async_socket  = async_load[? "socket"],
            _async_success = async_load[? "succeeded"];

        if (_async_id != _session_socket) {
            return;
        }
        
        var _is_remote = (_session_remote_sockets == undefined);
        
        if (!_is_remote) {
            return;
        }
        
        _session[? __NETPLAY_SESSION_STATUS] = (_async_success == true) ? NETPLAY_STATUS_CONNECTED : NETPLAY_STATUS_ERROR;
    
        if (_session_packet_queue != undefined) {
            for(var k = 0, l = ds_list_size(_session_packet_queue);k < l;k ++) {
                var _data = _session_packet_queue[| k];

                netplay_send(_session, _data[0], _data[1], _data[2]);
            }

            ds_map_delete(_session, __NETPLAY_SESSION_PACKET_QUEUE);
        }
        
        var _event_handlers = _session_event_handlers[? NETPLAY_EVENT_CONNECT];
        
        if (_event_handlers == undefined) {
            return;
        }
        
        for(var i = 0, j = ds_list_size(_event_handlers);i < j;i ++) {
            var _handler = _event_handlers[| i];
            
            var _pass = script_execute(_handler, _session, NETPLAY_EVENT_CONNECT, _async_socket, _async_ip, _async_port);
            
            if (_pass == false) {
                break;
            }
        }
    break;

    case network_type_connect:
        var _async_socket  = async_load[? "socket"],
            _async_success = async_load[? "succeeded"];

        if (_async_id != _session_socket) {
            return;
        }
        
        var _is_remote = (_session_remote_sockets == undefined);
        
        if (_is_remote) {
            return;
        }
        
        ds_map_add(_session_remote_sockets, _async_socket, [_async_ip, _async_port]);
        
        var _event_handlers = _session_event_handlers[? NETPLAY_EVENT_CONNECT];
        
        if (_event_handlers == undefined) {
            return;
        }
        
        for(var i = 0, j = ds_list_size(_event_handlers);i < j;i ++) {
            var _handler = _event_handlers[| i];
            
            var _pass = script_execute(_handler, _session, NETPLAY_EVENT_CONNECT, _async_socket);
            
            if (_pass == false) {
                break;
            }
        }
    break;
    
    case network_type_data:
        var _async_buffer = async_load[? "buffer"],
            _async_size   = async_load[? "size"];

        var _is_remote = (_session_remote_sockets == undefined),
            _process   = (_async_id == _session_socket);

        if (!_is_remote) {
            _process = (_async_id != _session_socket && ds_map_exists(_session_remote_sockets, _async_id));
        }
        
        if (!_process) {
            return;
        }
        
        var _event_handlers = _session_event_handlers[? NETPLAY_EVENT_RECV];
        
        if (_event_handlers != undefined) {
            for(var i = 0, j = ds_list_size(_event_handlers);i < j;i ++) {
                var _handler = _event_handlers[| i];
            
                var _pass = script_execute(_handler, _session, NETPLAY_EVENT_RECV, _async_id, _async_buffer);
                
                buffer_seek(_async_buffer, buffer_seek_start, 0);

                if (_pass == false) {
                    break;
                }
            }
        }
        
        buffer_seek(_async_buffer, buffer_seek_start, 0);
        
        var _packet_header = buffer_read(_async_buffer, _session_header_type),
            _packet_types  = _session_packets[? _packet_header],
            _packet_handlers = _session_packet_handlers[? NETPLAY_EVENT_RECV];

        if (_packet_handlers != undefined) {
            _packet_handlers = _packet_handlers[? _packet_header];
        }

        if (_packet_types == undefined || _packet_handlers == undefined) {
            return;
        }
        
        var _count  = array_length_1d(_packet_types),
            _values = array_create(_count, undefined);
        
        for(var k = 0;k < _count;k ++) {
            _values[k] = buffer_read(_async_buffer, _packet_types[k]);
        }
        
        for(var l = 0, m = ds_list_size(_packet_handlers);l < m;l ++) {
            var _handler = _packet_handlers[| l];
            
            var _pass = script_execute(_handler, _session, NETPLAY_EVENT_RECV, _async_id, _packet_header, _values);
            
            if (_pass == false) {
                break;
            }
        }
    break;
    
    case network_type_disconnect:
        var _async_socket  = async_load[? "socket"],
            _async_success = async_load[? "succeeded"];

        if (_async_id != _session_socket) {
            return;
        }
        
        var _is_remote = (_session_remote_sockets == undefined);
        
        if (_is_remote) {
            return;
        }

        if (ds_map_exists(_session_remote_sockets, _async_socket)) {
            ds_map_delete(_session_remote_sockets, _async_socket);
        }
        
        var _event_handlers = _session_event_handlers[? NETPLAY_EVENT_DISCONNECT];
        
        if (_event_handlers == undefined) {
            return;
        }
        
        for(var i = 0, j = ds_list_size(_event_handlers);i < j;i ++) {
            var _handler = _event_handlers[| i];
            
            var _pass = script_execute(_handler, _session, NETPLAY_EVENT_DISCONNECT, _async_socket);
            
            if (_pass == false) {
                break;
            }
        }
    break;
}