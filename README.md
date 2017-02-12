# netplay

netplay tackles the issue of "packets" in GameMaker and allows you to specify packet structure and packet handlers, handling all the data conversions behind the scenes.

## Echo example

### Client

```javascript
/// handle_echo(session, socket, client, uuid, params);
var text = params[0];

show_debug_message("Server sent " + text);
```

```javascript
session = netplay_connect("localhost", 5000);

netplay_set_packet(session, 1, buffer_string);
netplay_set_packet_handler(session, 1, handle_echo);

netplay_send(session, undefined, uuid, text);
```

### Server
```javascript
/// handle_echo(session, socket, client, uuid, params);
var text = params[0];

show_debug_message("Client sent " + text);
netplay_send(session, socket, uuid, text);
```

```javascript
session = netplay_open(5000, 32);

netplay_set_packet(session, 1, buffer_string);
netplay_set_packet_handler(session, undefined, 1, handle_echo);
```

## Built With

* [Game Maker Studio 2](http://www.yoyogames.com/gamemaker/studio2) - The game engine used

## Authors

* **Andrew Bennett** - *GML implementation* - [AndrewBGM](https://github.com/AndrewBGM)

See also the list of [contributors](https://github.com/AndrewBGM/netplay/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Bacause I wanted to
