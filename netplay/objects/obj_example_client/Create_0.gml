session = undefined; // Game Maker is dumb
session = netplay_connect("localhost", 5000);

netplay_add_packet(session, ExamplePackets.Echo, buffer_string);
netplay_add_packet(session, ExamplePackets.Increment, buffer_u16);

netplay_add_packet_handler(session, ExamplePackets.Echo, example_echo_client_handler);
netplay_add_packet_handler(session, ExamplePackets.Increment, example_increment_client_handler);

var socket = netplay_get_socket(session);
netplay_send(session, socket, ExamplePackets.Echo, "Hello World!");
netplay_send(session, socket, ExamplePackets.Increment, 10);