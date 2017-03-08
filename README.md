# Netplay

Networking abstraction layer for GameMaker Studio 2 which introduces formatted packets and offloaded packet handling

## Usage

Netplay uses the concept of a `session` to manage your networking. You create a `session` by calling `netplay_session`, and using this in all future Netplay functions. A session can be either a client session or a server session, but not both. Once you have created your session, use `netplay_connect` or `netplay_open` to either connect to an existing server, or start a new server.

```javascript
var session = netplay_session();

var socket = netplay_connect(session, "localhost", 5000); // Connect to a server on localhost:5000
var socket = netplay_open(session, 5000, 32); // Start a new server on localhost:5000
```

### Packets
Packets are formatted chunks of data, making use of GameMaker's `buffer` functions, and allowing for strict typing in your packets. This allows you to define the structure for your packet once and have Netplay handle the formatting of the data.
 > In the examples that follow, treat `ECHO_PACKET_ID` as `1`

```javascript
netplay_add_packet(session, ECHO_PACKET_ID, buffer_string);
```

When defining a packet via `netplay_add_packet`, you must supply a `session`  and `packet_id`, and the remaining arguments specify the structure of the packet. In this case, a single string value. To send a packet, you would use `netplay_send`.

```javascript
netplay_send(session, socket, ECHO_PACKET_ID, "Hello World!");
```

 > Packets are prefixed with a particular type, which is used to identify which packet is being sent and received. This defaults to `buffer_u8`, but can be changed via `netplay_set_header_type`

### Packet Handlers
Netplay allows you to assign scripts that will be invoked when a certain packet is received by the session. You can assign any number of scripts for a single packet type.

```javascript
/// scr_echo_callback(session, socket, ip, port, packet_id, values);
netplay_add_packet_handler(session, ECHO_PACKET_ID, scr_echo_callback);
```

For more information on handlers, see the [Event Handlers](#event-handlers) section below

### Event Handlers
When working packets, you need to assign handlers for them, but you can also assign handlers that are invoked on *every* data event. You can assign any number of handlers to events, just like packet handlers, and they will be invoked in the order they were added.

```javascript
event_connect_handler(session, socket, ip, port, success);
event_data_handler(session, socket, ip, port, buffer)
event_disconnect_handler(session, socket, ip, port, success);
```
 > If you return `false` from a handler, it will stop execution of further handlers in the sequence

### Asynchronous handling and cleanup
To enable Netplay to work, you *must* call `netplay_async` in the `Async - Networking` event of an instance, and supply it with your `session`.
When you are finished with the `session`, you should clean up all resources used by it via `netplay_destroy`.

### Function List
```javascript
netplay_session()
netplay_connect(session, host, port)
netplay_open(session, port, maxclients)
netplay_send(session, socket, packet_id, values...)
netplay_async(session)
netplay_destroy(session)

netplay_add_event_handler(session, event, handler)
netplay_remove_event_handler(session, event, handler)
netplay_get_event_handlers(session, event)

netplay_add_packet_handler(session, packet_id, handler)
netplay_remove_packet_handler(session, packet_id, handler)
netplay_get_packet_handlers(session, packet_id)

netplay_add_packet(session, packet_id, types...)
netplay_remove_packet(session, packet_id)
netplay_get_packets(session)

netplay_set_header_type(session, type)
netplay_get_header_type(session)

netplay_is_remote(session)
netplay_get_remote_sockets(session)

netplay_get_host(session)
netplay_get_port(session)
netplay_get_socket(session)
netplay_get_buffer(session)
```

## Built With

* [GameMaker Studio 2](http://www.yoyogames.com/gamemaker/studio2)

## Authors

* **Andrew Bennett** - *GML implementation* - [AndrewBGM](https://github.com/AndrewBGM)

See also the list of [contributors](https://github.com/AndrewBGM/netplay/contributors) who participated in this project

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details
