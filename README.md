# netplay

netplay tackles the issue of "packets" in GameMaker and allows you to specify packet structure and packet handlers, handling all the data conversions behind the scenes.

## Echo example

### Client

```javascript
/// handle_echo_client(session, socket, client_id, packet_id, params);
var session   = argument[0],
    socket    = argument[1],
    client_id = argument[2],
    packet_id = argument[3],
    params    = argument[4];

var text = params[0];

show_debug_message("Server sent " + text);
```

```javascript
session = netplay_connect("localhost", 5000);

netplay_set_packet(session, 1, buffer_string);
netplay_set_packet_handler(session, 1, handle_echo_client);

netplay_send(session, undefined, 1, text);
```

### Server
```javascript
/// handle_echo_server(session, socket, client_id, packet_id, params);
var session   = argument[0],
    socket    = argument[1],
    client_id = argument[2],
    packet_id = argument[3],
    params    = argument[4];

var text = params[0];

show_debug_message("Client sent " + text);
netplay_send(session, socket, packet_id, text);
```

```javascript
session = netplay_open(5000, 32);

netplay_set_packet(session, 1, buffer_string);
netplay_set_packet_handler(session, undefined, 1, handle_echo_server);
```

### Common
##### Networking Event: Async
```javascript
netplay_async(session);
```

##### Cleanup
```javascript
netplay_destroy(session);
```

## Event and Data handlers

You can also assign handlers to certain events, specifically handling incoming
connections for servers, and unknown packet types for both sides.

```javascript
netplay_set_event_handler(session, network_type_connect, handle_connect);
netplay_set_event_handler(session, network_type_disconnect, handle_disconnect);
netplay_set_event_handler(session, network_type_data, handle_data);
```

```javascript
/// handle_connect(session, ip, port, socket, client_id, success);
/// handle_disconnect(session, ip, port, socket, client_id, success);
/// handle_data(session, socket, client_id, buffer);
```

## Utility functions

There are more utility functions which don't need to be documented, as they are
self explanatory in their name, for instance `netplay_get_host`, `netplay_get_clients`
and `netplay_get_socket`.

## Built With

* [Game Maker Studio 2](http://www.yoyogames.com/gamemaker/studio2) - The game engine used

## Authors

* **Andrew Bennett** - *GML implementation* - [AndrewBGM](https://github.com/AndrewBGM)

See also the list of [contributors](https://github.com/AndrewBGM/netplay/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

## Acknowledgments

* Bacause I wanted to
