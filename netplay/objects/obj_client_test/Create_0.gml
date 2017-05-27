session = netplay_create(NETPLAY_TYPE_TCP);

netplay_add_event_handler(session, NETPLAY_EVENT_CONNECT, scr_handle_connect_client);
netplay_add_event_handler(session, NETPLAY_EVENT_RECV, scr_handle_recv_client);
netplay_add_event_handler(session, NETPLAY_EVENT_SEND, scr_handle_send_client);
netplay_add_event_handler(session, NETPLAY_EVENT_DISCONNECT, scr_handle_disconnect_client);

netplay_add_packet(session, 1, [buffer_string]);
netplay_add_packet_handler(session, NETPLAY_EVENT_SEND, 1, scr_handle_echo_client);
netplay_add_packet_handler(session, NETPLAY_EVENT_RECV, 1, scr_handle_echo_client);

socket  = netplay_join(session, "localhost", 5000);

netplay_send(session, socket, 1, ["Hello World!"]);
netplay_send(session, socket, 1, ["Goodbye World!"]);