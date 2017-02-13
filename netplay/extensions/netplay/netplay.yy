{
    "id": "147751e7-aaf3-4c33-839e-26e27b2f7dfb",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "netplay",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "date": "2017-36-13 12:02:28",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "5cc9776b-b049-4a48-b623-cd8ab8c31c3f",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ConfigOptions": [
                {
                    "Key": "default",
                    "Value": 0
                }
            ],
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "filename": "netplay-min.gml",
            "final": "",
            "functions": [
                {
                    "id": "ec07af4e-2133-4f60-8043-b1c25c445d66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_is_server",
                    "help": "netplay_is_server(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_is_server",
                    "returnType": 1
                },
                {
                    "id": "86c296bd-e40a-4fa4-921c-761e6a0aaa56",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_packet_size",
                    "help": "netplay_get_packet_size(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_packet_size",
                    "returnType": 1
                },
                {
                    "id": "56669ee6-3460-40fc-a141-738a704fa608",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_host",
                    "help": "netplay_get_host(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_host",
                    "returnType": 1
                },
                {
                    "id": "40b3c389-bef0-495d-8fd5-dbacba9701af",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_set_packet",
                    "help": "netplay_set_packet(session, uuid, types...)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_set_packet",
                    "returnType": 1
                },
                {
                    "id": "2aaa87de-42ab-4c7b-8495-45bc8387e925",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_packet",
                    "help": "netplay_get_packet(session, uuid)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_packet",
                    "returnType": 1
                },
                {
                    "id": "1c34c472-0343-4f0e-af68-e269f3d5351f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_destroy",
                    "help": "netplay_destroy(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_destroy",
                    "returnType": 1
                },
                {
                    "id": "4e79d488-0bc4-4ddb-aa83-e2de74206662",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_packets",
                    "help": "netplay_get_packets(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_packets",
                    "returnType": 1
                },
                {
                    "id": "24261b23-528e-4f5f-93f1-f72a94c6bdeb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_packet_handlers",
                    "help": "netplay_get_packet_handlers(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_packet_handlers",
                    "returnType": 1
                },
                {
                    "id": "cb9c3f0b-0b4b-4dea-b42b-6d7a3f586643",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_port",
                    "help": "netplay_get_port(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_port",
                    "returnType": 1
                },
                {
                    "id": "f842d656-c47f-4e74-adcc-c8f2c700630c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_set_packet_size",
                    "help": "netplay_set_packet_size(session, size)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_set_packet_size",
                    "returnType": 1
                },
                {
                    "id": "cba5f573-359f-42dc-b8f2-391343d1c2df",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_clients",
                    "help": "netplay_get_clients(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_clients",
                    "returnType": 1
                },
                {
                    "id": "40f36a41-ebb9-4612-9373-7c5a9faf17be",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_connect",
                    "help": "netplay_connect(host, port)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_connect",
                    "returnType": 1
                },
                {
                    "id": "64b53ebe-6daf-4a81-93aa-be6904b9e290",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_socket",
                    "help": "netplay_get_socket(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_socket",
                    "returnType": 1
                },
                {
                    "id": "95f5324f-3d00-4d7e-b27e-8b6996c0a76c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_buffer",
                    "help": "netplay_get_buffer(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_buffer",
                    "returnType": 1
                },
                {
                    "id": "0818dae1-e9e1-4ad0-9e42-b28a149740e2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_set_packet_type",
                    "help": "netplay_set_packet_type(session, type)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_set_packet_type",
                    "returnType": 1
                },
                {
                    "id": "68dbd665-e4a9-4924-9a6a-4243d818468a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_send",
                    "help": "netplay_send(session, socket, uuid, values...)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_send",
                    "returnType": 1
                },
                {
                    "id": "6dddb326-0d9d-4c57-8ecd-07032952392e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_client",
                    "help": "netplay_get_client(session, uuid)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_client",
                    "returnType": 1
                },
                {
                    "id": "7ccb6497-8747-4759-b89e-c7adea572e64",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_set_event_handler",
                    "help": "netplay_set_event_handler(session, event, handler)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_set_event_handler",
                    "returnType": 1
                },
                {
                    "id": "b7ae201e-8bbf-48c6-aff9-d444ffb90422",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_event_handler",
                    "help": "netplay_get_event_handler(session, event)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_event_handler",
                    "returnType": 1
                },
                {
                    "id": "417dd709-a1df-4dda-86e7-73a8e185c419",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_set_packet_handler",
                    "help": "netplay_set_packet_handler(session, uuid, handler)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_set_packet_handler",
                    "returnType": 1
                },
                {
                    "id": "a2387290-baa2-4e33-8c67-ddd16dcef8cb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_packet_type",
                    "help": "netplay_get_packet_type(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_packet_type",
                    "returnType": 1
                },
                {
                    "id": "97d2530b-1a3a-4a14-83a4-fce28ff14205",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_async",
                    "help": "netplay_async(session)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_async",
                    "returnType": 1
                },
                {
                    "id": "3afe1452-9657-4fa6-aff7-a71f47faa417",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_open",
                    "help": "netplay_open(port, maxclients)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_open",
                    "returnType": 1
                },
                {
                    "id": "658079d9-a846-4c6d-8f19-20d8d88f7975",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "netplay_get_packet_handler",
                    "help": "netplay_get_packet_handler(session, uuid)",
                    "hidden": false,
                    "kind": 2,
                    "name": "netplay_get_packet_handler",
                    "returnType": 1
                }
            ],
            "init": "",
            "kind": 2,
            "maskTarget": 0,
            "order": [
                "ec07af4e-2133-4f60-8043-b1c25c445d66",
                "86c296bd-e40a-4fa4-921c-761e6a0aaa56",
                "56669ee6-3460-40fc-a141-738a704fa608",
                "40b3c389-bef0-495d-8fd5-dbacba9701af",
                "2aaa87de-42ab-4c7b-8495-45bc8387e925",
                "1c34c472-0343-4f0e-af68-e269f3d5351f",
                "4e79d488-0bc4-4ddb-aa83-e2de74206662",
                "24261b23-528e-4f5f-93f1-f72a94c6bdeb",
                "cb9c3f0b-0b4b-4dea-b42b-6d7a3f586643",
                "f842d656-c47f-4e74-adcc-c8f2c700630c",
                "cba5f573-359f-42dc-b8f2-391343d1c2df",
                "40f36a41-ebb9-4612-9373-7c5a9faf17be",
                "64b53ebe-6daf-4a81-93aa-be6904b9e290",
                "95f5324f-3d00-4d7e-b27e-8b6996c0a76c",
                "0818dae1-e9e1-4ad0-9e42-b28a149740e2",
                "68dbd665-e4a9-4924-9a6a-4243d818468a",
                "6dddb326-0d9d-4c57-8ecd-07032952392e",
                "7ccb6497-8747-4759-b89e-c7adea572e64",
                "b7ae201e-8bbf-48c6-aff9-d444ffb90422",
                "417dd709-a1df-4dda-86e7-73a8e185c419",
                "a2387290-baa2-4e33-8c67-ddd16dcef8cb",
                "97d2530b-1a3a-4a14-83a4-fce28ff14205",
                "3afe1452-9657-4fa6-aff7-a71f47faa417",
                "658079d9-a846-4c6d-8f19-20d8d88f7975"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "version": "1.0.0"
}