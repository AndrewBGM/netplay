/// @description netplay_readme


gml_pragma("global", "netplay_readme();");

#macro NETPLAY_TYPE_TCP 0

#macro NETPLAY_EVENT_CONNECT    0
#macro NETPLAY_EVENT_SEND       1
#macro NETPLAY_EVENT_RECV       2
#macro NETPLAY_EVENT_DISCONNECT 3

#macro NETPLAY_STATUS_UNKNOWN      0
#macro NETPLAY_STATUS_PENDING      1
#macro NETPLAY_STATUS_CONNECTED    2
#macro NETPLAY_STATUS_DISCONNECTED 3
#macro NETPLAY_STATUS_ERROR        4

#macro __NETPLAY_SESSION_TYPE            0
#macro __NETPLAY_SESSION_HOST            1
#macro __NETPLAY_SESSION_PORT            2
#macro __NETPLAY_SESSION_STATUS          3
#macro __NETPLAY_SESSION_SOCKET          4
#macro __NETPLAY_SESSION_BUFFER          5
#macro __NETPLAY_SESSION_PACKETS         6
#macro __NETPLAY_SESSION_PACKET_HANDLERS 7
#macro __NETPLAY_SESSION_EVENT_HANDLERS  8
#macro __NETPLAY_SESSION_REMOTE_SOCKETS  9
#macro __NETPLAY_SESSION_HEADER_TYPE    10
#macro __NETPLAY_SESSION_PACKET_QUEUE   11


network_set_config(network_config_use_non_blocking_socket, true);