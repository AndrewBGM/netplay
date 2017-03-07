session = undefined; // GameMaker is dumb
session = netplay_open(5000, 32);

netplay_add_packet(session, ExamplePackets.Echo, buffer_string);
netplay_add_packet(session, ExamplePackets.Increment, buffer_u16);

netplay_add_packet_handler(session, ExamplePackets.Echo, example_echo_server_handler);
netplay_add_packet_handler(session, ExamplePackets.Increment, example_increment_server_handler);

alarm[0] = 5 * room_speed;