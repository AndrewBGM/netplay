session = netplay_create(NETPLAY_TYPE_TCP);

netplay_add_event_handler(session, NETPLAY_EVENT_CONNECT, scr_handle_connect_server);
netplay_add_event_handler(session, NETPLAY_EVENT_RECV, scr_handle_recv_server);
netplay_add_event_handler(session, NETPLAY_EVENT_SEND, scr_handle_send_server);
netplay_add_event_handler(session, NETPLAY_EVENT_DISCONNECT, scr_handle_disconnect_server);

netplay_add_packet(session, 1, [buffer_string]);
netplay_add_packet_handler(session, NETPLAY_EVENT_SEND, 1, scr_handle_echo_server);
netplay_add_packet_handler(session, NETPLAY_EVENT_RECV, 1, scr_handle_echo_server);

socket  = netplay_host(session, 5000, 32);

alarm_set(0, 3 * room_speed);