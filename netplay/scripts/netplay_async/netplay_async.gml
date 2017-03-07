/// @description netplay_async
/// @param session

var _session = argument[0];

var _async_type = async_load[? "type"],
    _async_id   = async_load[? "id"],
    _async_ip   = async_load[? "ip"],
    _async_port = async_load[? "port"];

switch(_async_type) {
    case network_type_connect:
        var _async_socket  = async_load[? "socket"],
            _async_success = async_load[? "success"];

        if (_async_id != _session[? "socket"]) {
            return;
        }

        var _is_server = (_session[? "host"] == "self");
        
        if (_is_server) {
            var _remote_sockets = _session[? "remote_sockets"];
            
            ds_list_add(_remote_sockets, _async_socket);
        }

        var _event_handlers = netplay_get_event_handlers(_session, network_type_connect);
        
        if (_event_handlers == undefined) {
            return;
        }
        
        for(var i = 0, j = ds_list_size(_event_handlers);i < j;i ++) {
            var _handler = _event_handlers[| i];
            
            var _pass = script_execute(_handler, _session, _async_socket, _async_ip, _async_port, _async_success);
            
            if (_pass == false) {
                break;
            }
        }

    break;
    
    case network_type_data:
        var _async_buffer = async_load[? "buffer"],
            _async_size   = async_load[? "size"];

        var _is_server = (_session[? "host"] == "self"),
            _process = (_async_id == _session[? "socket"]);

        if (_is_server) {
            var _remote_sockets = _session[? "remote_sockets"];
            
            _process = (_async_id != _session[? "socket"] && ds_list_find_index(_remote_sockets, _async_id) == 0);
        }
        
        if (!_process) {
            return;
        }

        var _event_handlers = netplay_get_event_handlers(_session, network_type_data);
        
        if (_event_handlers != undefined) {
            for(var i = 0, j = ds_list_size(_event_handlers);i < j;i ++) {
                var _handler = _event_handlers[| i];
            
                var _pass = script_execute(_handler, _session, _async_id, _async_ip, _async_port, _async_buffer);
                
                buffer_seek(_async_buffer, buffer_seek_start, 0);

                if (_pass == false) {
                    break;
                }
            }
        }
        
        buffer_seek(_async_buffer, buffer_seek_start, 0);
        
        var _packets         = _session[? "packets"],
            _packet_id       = buffer_read(_async_buffer, _session[? "header_type"]),
            _packet_types    = netplay_get_packet(_session, _packet_id),
            _packet_handlers = netplay_get_packet_handlers(_session, _packet_id);
        
        if (_packet_types == undefined || _packet_handlers == undefined) {
            return;
        }
        
        var _values = array_create(array_length_1d(_packet_types), undefined);
        
        for(var k = 0, l = array_length_1d(_values);k < l;k ++) {
            _values[k] = buffer_read(_async_buffer, _packet_types[k]);
        }
        
        for(var m = 0, n = ds_list_size(_packet_handlers);m < n;m ++) {
            var _handler = _packet_handlers[| m];
            
            var _pass = script_execute(_handler, _session, _async_id, _async_ip, _async_port, _packet_id, _values);
            
            if (!_pass) {
                break;
            }
        }
        
        
    break;
    
    case network_type_disconnect:
        var _async_socket  = async_load[? "socket"],
            _async_success = async_load[? "success"];

        if (_async_id != _session[? "socket"]) {
            return;
        }

        var _is_server = (_session[? "host"] == "self");
        
        if (_is_server) {
            var _remote_sockets = _session[? "remote_sockets"];
            
            var _index = ds_list_find_index(_remote_sockets, _async_id);

            if (_index >= 0) {
                ds_list_delete(_remote_sockets, _index);
            }
        }

        var _event_handlers = netplay_get_event_handlers(_session, network_type_disconnect);
        
        if (_event_handlers == undefined) {
            return;
        }
        
        for(var i = 0, j = ds_list_size(_event_handlers);i < j;i ++) {
            var _handler = _event_handlers[| i];
            
            var _pass = script_execute(_handler, _session, _async_socket, _async_ip, _async_port, _async_success);
            
            if (_pass == false) {
                break;
            }
        }

    break;
}