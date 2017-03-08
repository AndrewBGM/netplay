session = netplay_create_session();

netplay_add_event_handler(session, network_type_connect, example_connect_server_handler);
netplay_add_event_handler(session, network_type_data, example_data_server_handler);
netplay_add_event_handler(session, network_type_disconnect, example_disconnect_server_handler);

netplay_add_packet(session, ExamplePackets.Echo, buffer_string);
netplay_add_packet(session, ExamplePackets.Increment, buffer_u16);

netplay_add_packet_handler(session, ExamplePackets.Echo, example_echo_server_handler);
netplay_add_packet_handler(session, ExamplePackets.Increment, example_increment_server_handler);

socket  = netplay_open(session, 5000, 32);

alarm[0] = 5 * room_speed;