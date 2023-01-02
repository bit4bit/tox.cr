@[Link("toxcore")]
lib LibTox
  VERSION_MAJOR = 0
  VERSION_MINOR = 2
  VERSION_PATCH = 12
  PUBLIC_KEY_SIZE = 32
  SECRET_KEY_SIZE = 32
  CONFERENCE_UID_SIZE = 32
  CONFERENCE_ID_SIZE = 32
  MAX_NAME_LENGTH = 128
  MAX_STATUS_MESSAGE_LENGTH = 1007
  MAX_FRIEND_REQUEST_LENGTH = 1016
  MAX_MESSAGE_LENGTH = 1372
  MAX_CUSTOM_PACKET_SIZE = 1373
  HASH_LENGTH = 32
  FILE_ID_LENGTH = 32
  MAX_FILENAME_LENGTH = 255
  MAX_HOSTNAME_LENGTH = 255
  PASS_SALT_LENGTH = 32
  PASS_KEY_LENGTH = 32
  PASS_ENCRYPTION_EXTRA_LENGTH = 80
  fun version_major = tox_version_major : Uint32T
  alias X__Uint32T = LibC::UInt
  alias Uint32T = X__Uint32T
  fun version_minor = tox_version_minor : Uint32T
  fun version_patch = tox_version_patch : Uint32T
  fun version_is_compatible = tox_version_is_compatible(major : Uint32T, minor : Uint32T, patch : Uint32T) : LibC::Int
  fun public_key_size = tox_public_key_size : Uint32T
  fun secret_key_size = tox_secret_key_size : Uint32T
  fun conference_uid_size = tox_conference_uid_size : Uint32T
  fun conference_id_size = tox_conference_id_size : Uint32T
  fun nospam_size = tox_nospam_size : Uint32T
  fun address_size = tox_address_size : Uint32T
  fun max_name_length = tox_max_name_length : Uint32T
  fun max_status_message_length = tox_max_status_message_length : Uint32T
  fun max_friend_request_length = tox_max_friend_request_length : Uint32T
  fun max_message_length = tox_max_message_length : Uint32T
  fun max_custom_packet_size = tox_max_custom_packet_size : Uint32T
  fun hash_length = tox_hash_length : Uint32T
  fun file_id_length = tox_file_id_length : Uint32T
  fun max_filename_length = tox_max_filename_length : Uint32T
  fun max_hostname_length = tox_max_hostname_length : Uint32T
  fun options_get_ipv6_enabled = tox_options_get_ipv6_enabled(options : ToxOptions*) : LibC::Int
  struct ToxOptions
    ipv6_enabled : LibC::Int
    udp_enabled : LibC::Int
    local_discovery_enabled : LibC::Int
    proxy_type : ProxyType
    proxy_host : LibC::Char*
    proxy_port : Uint16T
    start_port : Uint16T
    end_port : Uint16T
    tcp_port : Uint16T
    hole_punching_enabled : LibC::Int
    savedata_type : SavedataType
    savedata_data : Uint8T*
    savedata_length : LibC::SizeT
    log_callback : (Tox, LogLevel, LibC::Char*, Uint32T, LibC::Char*, LibC::Char*, Void* -> Void)
    log_user_data : Void*
    experimental_thread_safety : LibC::Int
  end
  enum ProxyType
    ProxyTypeNone = 0
    ProxyTypeHttp = 1
    ProxyTypeSocks5 = 2
  end
  alias X__Uint16T = LibC::UShort
  alias Uint16T = X__Uint16T
  enum SavedataType
    SavedataTypeNone = 0
    SavedataTypeToxSave = 1
    SavedataTypeSecretKey = 2
  end
  alias X__Uint8T = UInt8
  alias Uint8T = X__Uint8T
  type Tox = Void*
  enum LogLevel
    LogLevelTrace = 0
    LogLevelDebug = 1
    LogLevelInfo = 2
    LogLevelWarning = 3
    LogLevelError = 4
  end
  fun options_set_ipv6_enabled = tox_options_set_ipv6_enabled(options : ToxOptions*, ipv6_enabled : LibC::Int)
  fun options_get_udp_enabled = tox_options_get_udp_enabled(options : ToxOptions*) : LibC::Int
  fun options_set_udp_enabled = tox_options_set_udp_enabled(options : ToxOptions*, udp_enabled : LibC::Int)
  fun options_get_local_discovery_enabled = tox_options_get_local_discovery_enabled(options : ToxOptions*) : LibC::Int
  fun options_set_local_discovery_enabled = tox_options_set_local_discovery_enabled(options : ToxOptions*, local_discovery_enabled : LibC::Int)
  fun options_get_proxy_type = tox_options_get_proxy_type(options : ToxOptions*) : ProxyType
  fun options_set_proxy_type = tox_options_set_proxy_type(options : ToxOptions*, type : ProxyType)
  fun options_get_proxy_host = tox_options_get_proxy_host(options : ToxOptions*) : LibC::Char*
  fun options_set_proxy_host = tox_options_set_proxy_host(options : ToxOptions*, host : LibC::Char*)
  fun options_get_proxy_port = tox_options_get_proxy_port(options : ToxOptions*) : Uint16T
  fun options_set_proxy_port = tox_options_set_proxy_port(options : ToxOptions*, port : Uint16T)
  fun options_get_start_port = tox_options_get_start_port(options : ToxOptions*) : Uint16T
  fun options_set_start_port = tox_options_set_start_port(options : ToxOptions*, start_port : Uint16T)
  fun options_get_end_port = tox_options_get_end_port(options : ToxOptions*) : Uint16T
  fun options_set_end_port = tox_options_set_end_port(options : ToxOptions*, end_port : Uint16T)
  fun options_get_tcp_port = tox_options_get_tcp_port(options : ToxOptions*) : Uint16T
  fun options_set_tcp_port = tox_options_set_tcp_port(options : ToxOptions*, tcp_port : Uint16T)
  fun options_get_hole_punching_enabled = tox_options_get_hole_punching_enabled(options : ToxOptions*) : LibC::Int
  fun options_set_hole_punching_enabled = tox_options_set_hole_punching_enabled(options : ToxOptions*, hole_punching_enabled : LibC::Int)
  fun options_get_savedata_type = tox_options_get_savedata_type(options : ToxOptions*) : SavedataType
  fun options_set_savedata_type = tox_options_set_savedata_type(options : ToxOptions*, type : SavedataType)
  fun options_get_savedata_data = tox_options_get_savedata_data(options : ToxOptions*) : Uint8T*
  fun options_set_savedata_data = tox_options_set_savedata_data(options : ToxOptions*, data : Uint8T*, length : LibC::SizeT)
  fun options_get_savedata_length = tox_options_get_savedata_length(options : ToxOptions*) : LibC::SizeT
  fun options_set_savedata_length = tox_options_set_savedata_length(options : ToxOptions*, length : LibC::SizeT)
  fun options_get_log_callback = tox_options_get_log_callback(options : ToxOptions*) : (Tox, LogLevel, LibC::Char*, Uint32T, LibC::Char*, LibC::Char*, Void* -> Void)
  fun options_set_log_callback = tox_options_set_log_callback(options : ToxOptions*, callback : (Tox, LogLevel, LibC::Char*, Uint32T, LibC::Char*, LibC::Char*, Void* -> Void))
  fun options_get_log_user_data = tox_options_get_log_user_data(options : ToxOptions*) : Void*
  fun options_set_log_user_data = tox_options_set_log_user_data(options : ToxOptions*, user_data : Void*)
  fun options_get_experimental_thread_safety = tox_options_get_experimental_thread_safety(options : ToxOptions*) : LibC::Int
  fun options_set_experimental_thread_safety = tox_options_set_experimental_thread_safety(options : ToxOptions*, thread_safety : LibC::Int)
  fun options_default = tox_options_default(options : ToxOptions*)
  fun options_new = tox_options_new(error : ErrOptionsNew*) : ToxOptions*
  enum ErrOptionsNew
    ErrOptionsNewOk = 0
    ErrOptionsNewMalloc = 1
  end
  fun options_free = tox_options_free(options : ToxOptions*)
  fun new = tox_new(options : ToxOptions*, error : ErrNew*) : Tox
  enum ErrNew
    ErrNewOk = 0
    ErrNewNull = 1
    ErrNewMalloc = 2
    ErrNewPortAlloc = 3
    ErrNewProxyBadType = 4
    ErrNewProxyBadHost = 5
    ErrNewProxyBadPort = 6
    ErrNewProxyNotFound = 7
    ErrNewLoadEncrypted = 8
    ErrNewLoadBadFormat = 9
  end
  fun kill = tox_kill(tox : Tox)
  fun get_savedata_size = tox_get_savedata_size(tox : Tox) : LibC::SizeT
  fun get_savedata = tox_get_savedata(tox : Tox, savedata : Uint8T*)
  fun bootstrap = tox_bootstrap(tox : Tox, host : LibC::Char*, port : Uint16T, public_key : Uint8T*, error : ErrBootstrap*) : LibC::Int
  enum ErrBootstrap
    ErrBootstrapOk = 0
    ErrBootstrapNull = 1
    ErrBootstrapBadHost = 2
    ErrBootstrapBadPort = 3
  end
  fun add_tcp_relay = tox_add_tcp_relay(tox : Tox, host : LibC::Char*, port : Uint16T, public_key : Uint8T*, error : ErrBootstrap*) : LibC::Int
  fun self_get_connection_status = tox_self_get_connection_status(tox : Tox) : Connection
  enum Connection
    ConnectionNone = 0
    ConnectionTcp = 1
    ConnectionUdp = 2
  end
  fun callback_self_connection_status = tox_callback_self_connection_status(tox : Tox, callback : (Tox, Connection, Void* -> Void))
  fun iteration_interval = tox_iteration_interval(tox : Tox) : Uint32T
  fun iterate = tox_iterate(tox : Tox, user_data : Void*)
  fun self_get_address = tox_self_get_address(tox : Tox, address : Uint8T*)
  fun self_set_nospam = tox_self_set_nospam(tox : Tox, nospam : Uint32T)
  fun self_get_nospam = tox_self_get_nospam(tox : Tox) : Uint32T
  fun self_get_public_key = tox_self_get_public_key(tox : Tox, public_key : Uint8T*)
  fun self_get_secret_key = tox_self_get_secret_key(tox : Tox, secret_key : Uint8T*)
  fun self_set_name = tox_self_set_name(tox : Tox, name : Uint8T*, length : LibC::SizeT, error : ErrSetInfo*) : LibC::Int
  enum ErrSetInfo
    ErrSetInfoOk = 0
    ErrSetInfoNull = 1
    ErrSetInfoTooLong = 2
  end
  fun self_get_name_size = tox_self_get_name_size(tox : Tox) : LibC::SizeT
  fun self_get_name = tox_self_get_name(tox : Tox, name : Uint8T*)
  fun self_set_status_message = tox_self_set_status_message(tox : Tox, status_message : Uint8T*, length : LibC::SizeT, error : ErrSetInfo*) : LibC::Int
  fun self_get_status_message_size = tox_self_get_status_message_size(tox : Tox) : LibC::SizeT
  fun self_get_status_message = tox_self_get_status_message(tox : Tox, status_message : Uint8T*)
  fun self_set_status = tox_self_set_status(tox : Tox, status : UserStatus)
  enum UserStatus
    UserStatusNone = 0
    UserStatusAway = 1
    UserStatusBusy = 2
  end
  fun self_get_status = tox_self_get_status(tox : Tox) : UserStatus
  fun friend_add = tox_friend_add(tox : Tox, address : Uint8T*, message : Uint8T*, length : LibC::SizeT, error : ErrFriendAdd*) : Uint32T
  enum ErrFriendAdd
    ErrFriendAddOk = 0
    ErrFriendAddNull = 1
    ErrFriendAddTooLong = 2
    ErrFriendAddNoMessage = 3
    ErrFriendAddOwnKey = 4
    ErrFriendAddAlreadySent = 5
    ErrFriendAddBadChecksum = 6
    ErrFriendAddSetNewNospam = 7
    ErrFriendAddMalloc = 8
  end
  fun friend_add_norequest = tox_friend_add_norequest(tox : Tox, public_key : Uint8T*, error : ErrFriendAdd*) : Uint32T
  fun friend_delete = tox_friend_delete(tox : Tox, friend_number : Uint32T, error : ErrFriendDelete*) : LibC::Int
  enum ErrFriendDelete
    ErrFriendDeleteOk = 0
    ErrFriendDeleteFriendNotFound = 1
  end
  fun friend_by_public_key = tox_friend_by_public_key(tox : Tox, public_key : Uint8T*, error : ErrFriendByPublicKey*) : Uint32T
  enum ErrFriendByPublicKey
    ErrFriendByPublicKeyOk = 0
    ErrFriendByPublicKeyNull = 1
    ErrFriendByPublicKeyNotFound = 2
  end
  fun friend_exists = tox_friend_exists(tox : Tox, friend_number : Uint32T) : LibC::Int
  fun self_get_friend_list_size = tox_self_get_friend_list_size(tox : Tox) : LibC::SizeT
  fun self_get_friend_list = tox_self_get_friend_list(tox : Tox, friend_list : Uint32T*)
  fun friend_get_public_key = tox_friend_get_public_key(tox : Tox, friend_number : Uint32T, public_key : Uint8T*, error : ErrFriendGetPublicKey*) : LibC::Int
  enum ErrFriendGetPublicKey
    ErrFriendGetPublicKeyOk = 0
    ErrFriendGetPublicKeyFriendNotFound = 1
  end
  fun friend_get_last_online = tox_friend_get_last_online(tox : Tox, friend_number : Uint32T, error : ErrFriendGetLastOnline*) : Uint64T
  enum ErrFriendGetLastOnline
    ErrFriendGetLastOnlineOk = 0
    ErrFriendGetLastOnlineFriendNotFound = 1
  end
  alias X__Uint64T = LibC::ULong
  alias Uint64T = X__Uint64T
  fun friend_get_name_size = tox_friend_get_name_size(tox : Tox, friend_number : Uint32T, error : ErrFriendQuery*) : LibC::SizeT
  enum ErrFriendQuery
    ErrFriendQueryOk = 0
    ErrFriendQueryNull = 1
    ErrFriendQueryFriendNotFound = 2
  end
  fun friend_get_name = tox_friend_get_name(tox : Tox, friend_number : Uint32T, name : Uint8T*, error : ErrFriendQuery*) : LibC::Int
  fun callback_friend_name = tox_callback_friend_name(tox : Tox, callback : (Tox, Uint32T, Uint8T*, LibC::SizeT, Void* -> Void))
  fun friend_get_status_message_size = tox_friend_get_status_message_size(tox : Tox, friend_number : Uint32T, error : ErrFriendQuery*) : LibC::SizeT
  fun friend_get_status_message = tox_friend_get_status_message(tox : Tox, friend_number : Uint32T, status_message : Uint8T*, error : ErrFriendQuery*) : LibC::Int
  fun callback_friend_status_message = tox_callback_friend_status_message(tox : Tox, callback : (Tox, Uint32T, Uint8T*, LibC::SizeT, Void* -> Void))
  fun friend_get_status = tox_friend_get_status(tox : Tox, friend_number : Uint32T, error : ErrFriendQuery*) : UserStatus
  fun callback_friend_status = tox_callback_friend_status(tox : Tox, callback : (Tox, Uint32T, UserStatus, Void* -> Void))
  fun friend_get_connection_status = tox_friend_get_connection_status(tox : Tox, friend_number : Uint32T, error : ErrFriendQuery*) : Connection
  fun callback_friend_connection_status = tox_callback_friend_connection_status(tox : Tox, callback : (Tox, Uint32T, Connection, Void* -> Void))
  fun friend_get_typing = tox_friend_get_typing(tox : Tox, friend_number : Uint32T, error : ErrFriendQuery*) : LibC::Int
  fun callback_friend_typing = tox_callback_friend_typing(tox : Tox, callback : (Tox, Uint32T, LibC::Int, Void* -> Void))
  fun self_set_typing = tox_self_set_typing(tox : Tox, friend_number : Uint32T, typing : LibC::Int, error : ErrSetTyping*) : LibC::Int
  enum ErrSetTyping
    ErrSetTypingOk = 0
    ErrSetTypingFriendNotFound = 1
  end
  fun friend_send_message = tox_friend_send_message(tox : Tox, friend_number : Uint32T, type : MessageType, message : Uint8T*, length : LibC::SizeT, error : ErrFriendSendMessage*) : Uint32T
  enum MessageType
    MessageTypeNormal = 0
    MessageTypeAction = 1
  end
  enum ErrFriendSendMessage
    ErrFriendSendMessageOk = 0
    ErrFriendSendMessageNull = 1
    ErrFriendSendMessageFriendNotFound = 2
    ErrFriendSendMessageFriendNotConnected = 3
    ErrFriendSendMessageSendq = 4
    ErrFriendSendMessageTooLong = 5
    ErrFriendSendMessageEmpty = 6
  end
  fun callback_friend_read_receipt = tox_callback_friend_read_receipt(tox : Tox, callback : (Tox, Uint32T, Uint32T, Void* -> Void))
  fun callback_friend_request = tox_callback_friend_request(tox : Tox, callback : (Tox, Uint8T*, Uint8T*, LibC::SizeT, Void* -> Void))
  fun callback_friend_message = tox_callback_friend_message(tox : Tox, callback : (Tox, Uint32T, MessageType, Uint8T*, LibC::SizeT, Void* -> Void))
  fun hash = tox_hash(hash : Uint8T*, data : Uint8T*, length : LibC::SizeT) : LibC::Int
  fun file_control = tox_file_control(tox : Tox, friend_number : Uint32T, file_number : Uint32T, control : FileControl, error : ErrFileControl*) : LibC::Int
  enum FileControl
    FileControlResume = 0
    FileControlPause = 1
    FileControlCancel = 2
  end
  enum ErrFileControl
    ErrFileControlOk = 0
    ErrFileControlFriendNotFound = 1
    ErrFileControlFriendNotConnected = 2
    ErrFileControlNotFound = 3
    ErrFileControlNotPaused = 4
    ErrFileControlDenied = 5
    ErrFileControlAlreadyPaused = 6
    ErrFileControlSendq = 7
  end
  fun callback_file_recv_control = tox_callback_file_recv_control(tox : Tox, callback : (Tox, Uint32T, Uint32T, FileControl, Void* -> Void))
  fun file_seek = tox_file_seek(tox : Tox, friend_number : Uint32T, file_number : Uint32T, position : Uint64T, error : ErrFileSeek*) : LibC::Int
  enum ErrFileSeek
    ErrFileSeekOk = 0
    ErrFileSeekFriendNotFound = 1
    ErrFileSeekFriendNotConnected = 2
    ErrFileSeekNotFound = 3
    ErrFileSeekDenied = 4
    ErrFileSeekInvalidPosition = 5
    ErrFileSeekSendq = 6
  end
  fun file_get_file_id = tox_file_get_file_id(tox : Tox, friend_number : Uint32T, file_number : Uint32T, file_id : Uint8T*, error : ErrFileGet*) : LibC::Int
  enum ErrFileGet
    ErrFileGetOk = 0
    ErrFileGetNull = 1
    ErrFileGetFriendNotFound = 2
    ErrFileGetNotFound = 3
  end
  fun file_send = tox_file_send(tox : Tox, friend_number : Uint32T, kind : Uint32T, file_size : Uint64T, file_id : Uint8T*, filename : Uint8T*, filename_length : LibC::SizeT, error : ErrFileSend*) : Uint32T
  enum ErrFileSend
    ErrFileSendOk = 0
    ErrFileSendNull = 1
    ErrFileSendFriendNotFound = 2
    ErrFileSendFriendNotConnected = 3
    ErrFileSendNameTooLong = 4
    ErrFileSendTooMany = 5
  end
  fun file_send_chunk = tox_file_send_chunk(tox : Tox, friend_number : Uint32T, file_number : Uint32T, position : Uint64T, data : Uint8T*, length : LibC::SizeT, error : ErrFileSendChunk*) : LibC::Int
  enum ErrFileSendChunk
    ErrFileSendChunkOk = 0
    ErrFileSendChunkNull = 1
    ErrFileSendChunkFriendNotFound = 2
    ErrFileSendChunkFriendNotConnected = 3
    ErrFileSendChunkNotFound = 4
    ErrFileSendChunkNotTransferring = 5
    ErrFileSendChunkInvalidLength = 6
    ErrFileSendChunkSendq = 7
    ErrFileSendChunkWrongPosition = 8
  end
  fun callback_file_chunk_request = tox_callback_file_chunk_request(tox : Tox, callback : (Tox, Uint32T, Uint32T, Uint64T, LibC::SizeT, Void* -> Void))
  fun callback_file_recv = tox_callback_file_recv(tox : Tox, callback : (Tox, Uint32T, Uint32T, Uint32T, Uint64T, Uint8T*, LibC::SizeT, Void* -> Void))
  fun callback_file_recv_chunk = tox_callback_file_recv_chunk(tox : Tox, callback : (Tox, Uint32T, Uint32T, Uint64T, Uint8T*, LibC::SizeT, Void* -> Void))
  fun callback_conference_invite = tox_callback_conference_invite(tox : Tox, callback : (Tox, Uint32T, ConferenceType, Uint8T*, LibC::SizeT, Void* -> Void))
  enum ConferenceType
    ConferenceTypeText = 0
    ConferenceTypeAv = 1
  end
  fun callback_conference_connected = tox_callback_conference_connected(tox : Tox, callback : (Tox, Uint32T, Void* -> Void))
  fun callback_conference_message = tox_callback_conference_message(tox : Tox, callback : (Tox, Uint32T, Uint32T, MessageType, Uint8T*, LibC::SizeT, Void* -> Void))
  fun callback_conference_title = tox_callback_conference_title(tox : Tox, callback : (Tox, Uint32T, Uint32T, Uint8T*, LibC::SizeT, Void* -> Void))
  fun callback_conference_peer_name = tox_callback_conference_peer_name(tox : Tox, callback : (Tox, Uint32T, Uint32T, Uint8T*, LibC::SizeT, Void* -> Void))
  fun callback_conference_peer_list_changed = tox_callback_conference_peer_list_changed(tox : Tox, callback : (Tox, Uint32T, Void* -> Void))
  fun conference_new = tox_conference_new(tox : Tox, error : ErrConferenceNew*) : Uint32T
  enum ErrConferenceNew
    ErrConferenceNewOk = 0
    ErrConferenceNewInit = 1
  end
  fun conference_delete = tox_conference_delete(tox : Tox, conference_number : Uint32T, error : ErrConferenceDelete*) : LibC::Int
  enum ErrConferenceDelete
    ErrConferenceDeleteOk = 0
    ErrConferenceDeleteConferenceNotFound = 1
  end
  fun conference_peer_count = tox_conference_peer_count(tox : Tox, conference_number : Uint32T, error : ErrConferencePeerQuery*) : Uint32T
  enum ErrConferencePeerQuery
    ErrConferencePeerQueryOk = 0
    ErrConferencePeerQueryConferenceNotFound = 1
    ErrConferencePeerQueryPeerNotFound = 2
    ErrConferencePeerQueryNoConnection = 3
  end
  fun conference_peer_get_name_size = tox_conference_peer_get_name_size(tox : Tox, conference_number : Uint32T, peer_number : Uint32T, error : ErrConferencePeerQuery*) : LibC::SizeT
  fun conference_peer_get_name = tox_conference_peer_get_name(tox : Tox, conference_number : Uint32T, peer_number : Uint32T, name : Uint8T*, error : ErrConferencePeerQuery*) : LibC::Int
  fun conference_peer_get_public_key = tox_conference_peer_get_public_key(tox : Tox, conference_number : Uint32T, peer_number : Uint32T, public_key : Uint8T*, error : ErrConferencePeerQuery*) : LibC::Int
  fun conference_peer_number_is_ours = tox_conference_peer_number_is_ours(tox : Tox, conference_number : Uint32T, peer_number : Uint32T, error : ErrConferencePeerQuery*) : LibC::Int
  fun conference_offline_peer_count = tox_conference_offline_peer_count(tox : Tox, conference_number : Uint32T, error : ErrConferencePeerQuery*) : Uint32T
  fun conference_offline_peer_get_name_size = tox_conference_offline_peer_get_name_size(tox : Tox, conference_number : Uint32T, offline_peer_number : Uint32T, error : ErrConferencePeerQuery*) : LibC::SizeT
  fun conference_offline_peer_get_name = tox_conference_offline_peer_get_name(tox : Tox, conference_number : Uint32T, offline_peer_number : Uint32T, name : Uint8T*, error : ErrConferencePeerQuery*) : LibC::Int
  fun conference_offline_peer_get_public_key = tox_conference_offline_peer_get_public_key(tox : Tox, conference_number : Uint32T, offline_peer_number : Uint32T, public_key : Uint8T*, error : ErrConferencePeerQuery*) : LibC::Int
  fun conference_offline_peer_get_last_active = tox_conference_offline_peer_get_last_active(tox : Tox, conference_number : Uint32T, offline_peer_number : Uint32T, error : ErrConferencePeerQuery*) : Uint64T
  fun conference_set_max_offline = tox_conference_set_max_offline(tox : Tox, conference_number : Uint32T, max_offline_peers : Uint32T, error : ErrConferenceSetMaxOffline*) : LibC::Int
  enum ErrConferenceSetMaxOffline
    ErrConferenceSetMaxOfflineOk = 0
    ErrConferenceSetMaxOfflineConferenceNotFound = 1
  end
  fun conference_invite = tox_conference_invite(tox : Tox, friend_number : Uint32T, conference_number : Uint32T, error : ErrConferenceInvite*) : LibC::Int
  enum ErrConferenceInvite
    ErrConferenceInviteOk = 0
    ErrConferenceInviteConferenceNotFound = 1
    ErrConferenceInviteFailSend = 2
    ErrConferenceInviteNoConnection = 3
  end
  fun conference_join = tox_conference_join(tox : Tox, friend_number : Uint32T, cookie : Uint8T*, length : LibC::SizeT, error : ErrConferenceJoin*) : Uint32T
  enum ErrConferenceJoin
    ErrConferenceJoinOk = 0
    ErrConferenceJoinInvalidLength = 1
    ErrConferenceJoinWrongType = 2
    ErrConferenceJoinFriendNotFound = 3
    ErrConferenceJoinDuplicate = 4
    ErrConferenceJoinInitFail = 5
    ErrConferenceJoinFailSend = 6
  end
  fun conference_send_message = tox_conference_send_message(tox : Tox, conference_number : Uint32T, type : MessageType, message : Uint8T*, length : LibC::SizeT, error : ErrConferenceSendMessage*) : LibC::Int
  enum ErrConferenceSendMessage
    ErrConferenceSendMessageOk = 0
    ErrConferenceSendMessageConferenceNotFound = 1
    ErrConferenceSendMessageTooLong = 2
    ErrConferenceSendMessageNoConnection = 3
    ErrConferenceSendMessageFailSend = 4
  end
  fun conference_get_title_size = tox_conference_get_title_size(tox : Tox, conference_number : Uint32T, error : ErrConferenceTitle*) : LibC::SizeT
  enum ErrConferenceTitle
    ErrConferenceTitleOk = 0
    ErrConferenceTitleConferenceNotFound = 1
    ErrConferenceTitleInvalidLength = 2
    ErrConferenceTitleFailSend = 3
  end
  fun conference_get_title = tox_conference_get_title(tox : Tox, conference_number : Uint32T, title : Uint8T*, error : ErrConferenceTitle*) : LibC::Int
  fun conference_set_title = tox_conference_set_title(tox : Tox, conference_number : Uint32T, title : Uint8T*, length : LibC::SizeT, error : ErrConferenceTitle*) : LibC::Int
  fun conference_get_chatlist_size = tox_conference_get_chatlist_size(tox : Tox) : LibC::SizeT
  fun conference_get_chatlist = tox_conference_get_chatlist(tox : Tox, chatlist : Uint32T*)
  fun conference_get_type = tox_conference_get_type(tox : Tox, conference_number : Uint32T, error : ErrConferenceGetType*) : ConferenceType
  enum ErrConferenceGetType
    ErrConferenceGetTypeOk = 0
    ErrConferenceGetTypeConferenceNotFound = 1
  end
  fun conference_get_id = tox_conference_get_id(tox : Tox, conference_number : Uint32T, id : Uint8T*) : LibC::Int
  fun conference_by_id = tox_conference_by_id(tox : Tox, id : Uint8T*, error : ErrConferenceById*) : Uint32T
  enum ErrConferenceById
    ErrConferenceByIdOk = 0
    ErrConferenceByIdNull = 1
    ErrConferenceByIdNotFound = 2
  end
  fun conference_get_uid = tox_conference_get_uid(tox : Tox, conference_number : Uint32T, uid : Uint8T*) : LibC::Int
  fun conference_by_uid = tox_conference_by_uid(tox : Tox, uid : Uint8T*, error : ErrConferenceByUid*) : Uint32T
  enum ErrConferenceByUid
    ErrConferenceByUidOk = 0
    ErrConferenceByUidNull = 1
    ErrConferenceByUidNotFound = 2
  end
  fun friend_send_lossy_packet = tox_friend_send_lossy_packet(tox : Tox, friend_number : Uint32T, data : Uint8T*, length : LibC::SizeT, error : ErrFriendCustomPacket*) : LibC::Int
  enum ErrFriendCustomPacket
    ErrFriendCustomPacketOk = 0
    ErrFriendCustomPacketNull = 1
    ErrFriendCustomPacketFriendNotFound = 2
    ErrFriendCustomPacketFriendNotConnected = 3
    ErrFriendCustomPacketInvalid = 4
    ErrFriendCustomPacketEmpty = 5
    ErrFriendCustomPacketTooLong = 6
    ErrFriendCustomPacketSendq = 7
  end
  fun friend_send_lossless_packet = tox_friend_send_lossless_packet(tox : Tox, friend_number : Uint32T, data : Uint8T*, length : LibC::SizeT, error : ErrFriendCustomPacket*) : LibC::Int
  fun callback_friend_lossy_packet = tox_callback_friend_lossy_packet(tox : Tox, callback : (Tox, Uint32T, Uint8T*, LibC::SizeT, Void* -> Void))
  fun callback_friend_lossless_packet = tox_callback_friend_lossless_packet(tox : Tox, callback : (Tox, Uint32T, Uint8T*, LibC::SizeT, Void* -> Void))
  fun self_get_dht_id = tox_self_get_dht_id(tox : Tox, dht_id : Uint8T*)
  fun self_get_udp_port = tox_self_get_udp_port(tox : Tox, error : ErrGetPort*) : Uint16T
  enum ErrGetPort
    ErrGetPortOk = 0
    ErrGetPortNotBound = 1
  end
  fun self_get_tcp_port = tox_self_get_tcp_port(tox : Tox, error : ErrGetPort*) : Uint16T
  fun pass_salt_length = tox_pass_salt_length : Uint32T
  fun pass_key_length = tox_pass_key_length : Uint32T
  fun pass_encryption_extra_length = tox_pass_encryption_extra_length : Uint32T
  fun pass_encrypt = tox_pass_encrypt(plaintext : Uint8T*, plaintext_len : LibC::SizeT, passphrase : Uint8T*, passphrase_len : LibC::SizeT, ciphertext : Uint8T*, error : ErrEncryption*) : LibC::Int
  enum ErrEncryption
    ErrEncryptionOk = 0
    ErrEncryptionNull = 1
    ErrEncryptionKeyDerivationFailed = 2
    ErrEncryptionFailed = 3
  end
  fun pass_decrypt = tox_pass_decrypt(ciphertext : Uint8T*, ciphertext_len : LibC::SizeT, passphrase : Uint8T*, passphrase_len : LibC::SizeT, plaintext : Uint8T*, error : ErrDecryption*) : LibC::Int
  enum ErrDecryption
    ErrDecryptionOk = 0
    ErrDecryptionNull = 1
    ErrDecryptionInvalidLength = 2
    ErrDecryptionBadFormat = 3
    ErrDecryptionKeyDerivationFailed = 4
    ErrDecryptionFailed = 5
  end
  fun pass_key_free = tox_pass_key_free(_key : ToxPassKey*)
  alias ToxPassKey = Void
  fun pass_key_derive = tox_pass_key_derive(passphrase : Uint8T*, passphrase_len : LibC::SizeT, error : ErrKeyDerivation*) : ToxPassKey*
  enum ErrKeyDerivation
    ErrKeyDerivationOk = 0
    ErrKeyDerivationNull = 1
    ErrKeyDerivationFailed = 2
  end
  fun pass_key_derive_with_salt = tox_pass_key_derive_with_salt(passphrase : Uint8T*, passphrase_len : LibC::SizeT, salt : Uint8T*, error : ErrKeyDerivation*) : ToxPassKey*
  fun pass_key_encrypt = tox_pass_key_encrypt(_key : ToxPassKey*, plaintext : Uint8T*, plaintext_len : LibC::SizeT, ciphertext : Uint8T*, error : ErrEncryption*) : LibC::Int
  fun pass_key_decrypt = tox_pass_key_decrypt(_key : ToxPassKey*, ciphertext : Uint8T*, ciphertext_len : LibC::SizeT, plaintext : Uint8T*, error : ErrDecryption*) : LibC::Int
  fun get_salt = tox_get_salt(ciphertext : Uint8T*, salt : Uint8T*, error : ErrGetSalt*) : LibC::Int
  enum ErrGetSalt
    ErrGetSaltOk = 0
    ErrGetSaltNull = 1
    ErrGetSaltBadFormat = 2
  end
  fun is_data_encrypted = tox_is_data_encrypted(data : Uint8T*) : LibC::Int
end
