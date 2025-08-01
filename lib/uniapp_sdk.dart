import 'uniapp_sdk_platform_interface.dart';

export 'uniapp_sdk_platform_interface.dart'
    show UniAppConfiguration, UniAPPOpenMode;

class UniappSdk {
  Future<bool> open(
    String id, {
    UniAppConfiguration? config,
    void Function(String)? onClosed,
    void Function(dynamic)? onReceive,
  }) async {
    return UniappSdkPlatform.instance.open(
      id,
      config: config,
      onClosed: onClosed,
      onReceive: onReceive,
    );
  }

  Future<bool> install(
    String id, {
    String path = '',
    String password = '',
  }) async {
    return UniappSdkPlatform.instance.install(
      id,
      path: path,
      password: password,
    );
  }

  Future<bool> isExist(String id) async {
    return UniappSdkPlatform.instance.isExist(id);
  }

  Future<dynamic> getVersionInfo(String id) async {
    return UniappSdkPlatform.instance.getVersionInfo(id);
  }

  Future<bool> sendEvent({
    required String event,
    Map<String, dynamic>? data,
  }) async {
    return UniappSdkPlatform.instance.sendEvent(
      event: event,
      data: data,
    );
  }
}
