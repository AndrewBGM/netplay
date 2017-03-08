session = netplay_session();
socket = netplay_connect(session, "localhost", 5000);

netplay_add_event_handler(session, network_type_connect, example_connect_client_handler);
netplay_add_event_handler(session, network_type_data, example_data_client_handler);
netplay_add_event_handler(session, network_type_disconnect, example_disconnect_client_handler);

netplay_add_packet(session, ExamplePackets.Echo, buffer_string);
netplay_add_packet(session, ExamplePackets.Increment, buffer_u16);

netplay_add_packet_handler(session, ExamplePackets.Echo, example_echo_client_handler);
netplay_add_packet_handler(session, ExamplePackets.Increment, example_increment_client_handler);

netplay_send(session, socket, ExamplePackets.Echo, "Hello World!");
netplay_send(session, socket, ExamplePackets.Increment, 10);