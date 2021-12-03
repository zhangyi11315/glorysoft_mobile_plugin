[![Flutter Community: after_layout](https://img1.baidu.com/it/u=2703618778,1142181950&fm=26&fmt=auto)](https://github.com/zhangyi11315/glorysoft_mobile_plugin)

# glorysoft_mobile_plugin 0.0.1

[Flutter常用工具类](https://pub.dartlang.org/packages/after_layout)

## 使用
在程序入口需要初始化service服务
```dart
initServices() async {
  print('starting services ...');
  await Get.putAsync(() => AppSpService().init());
  await Get.putAsync(() => AppPackageService().init());
  Get.put(HttpClient(dioConfig: HttpConfig(baseUrl: "")));
  print('All services started...');
}
```


## Extension  基础类扩展

**StringExtension**

```dart
   /// 判断是否是邮箱
  bool isEmail() {
    String regexEmail = '[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}';
    return RegExp(regexEmail).hasMatch(this);
  }

  /// 判断是否手机号
  bool isMobile(){
    return RegExp(r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0,1,3,5,6,7,8])|(19)[0-9])\d{8}$').hasMatch(this);
  }

  /// string 转 int
  int toInt() {
    return int.parse(this);
  }

  /// string 转 double
  double toDouble() {
    return double.parse(this);
  }
```
**WidgetExtension**
  Widget常用扩展添加间距，点击事件等
```dart
    Widget padding(EdgeInsetsGeometry padding) {
    return Padding(
      child: this,
      padding: padding,
    );
  }

  Material gesture({
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
  }) {
    return Material(
      child: InkWell(
        child: this,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
      ),
    );
  }
```
## Global
  全局属性方法

## Http
  网络请求封装
```dart
  Future<HttpResponse> get(String uri,
      {Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
        HttpTransformer? httpTransformer,
        bool isShowLoading = true}) async {
    try {
      if(isShowLoading) EasyLoading.show(status: 'loading...');
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if(isShowLoading) EasyLoading.dismiss();
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return handleException(e);
    }
  }
```
**调用**
```dart
  static Future<HttpResponse<LotEntity>> lotInfo(CancelToken? cancelToken,{Map<String,dynamic>? params}) async {
    var response = await Get.find<HttpClient>().get<LotEntity>(
        'esbrest/RestService/postrequest',
        data: RequestUtil.formatJsonDataParameters(funcName:'XN.XNLOTQUERY',parame: params),
        cancelToken: cancelToken
    );
    return response;
  }
```
## service
  工具服务，全局调用

## util
  常用工具类封装

  **DateUtil 时间处理工具类**

  **DatePickerUtil 时间选择控件工具**

  **DirectoryUtil 路径工具类**

    getTemporaryDirectory
    设备上未备份的临时目录的路径，适用于存储下载文件的缓存。
    此目录中的文件可以随时清除。 *不会*返回新的临时目录。 相反，调用者负责在此目录中创建（和清理）文件或目录。 此目录的作用域是调用应用程序。
    在iOS上，它使用“NSCachesDirectory”API。
    在Android上，它在上下文中使用“getCacheDir”API。

    getApplicationSupportDirectory
    应用程序可以在其中放置应用程序支持文件的目录的路径。
    将此文件用于您不想向用户公开的文件。 您的应用不应将此目录用于用户数据文件。
    在iOS上，它使用`NSApplicationSupportDirectory` API。 如果此目录不存在，则会自动创建。
    在Android上，此函数在上下文中使用`getFilesDir` API。

    getApplicationDocumentsDirectory
    应用程序可能在其中放置用户生成的数据或应用程序无法重新创建的数据的目录路径。
    在iOS上，它使用`NSDocumentDirectory` API。 如果不是用户生成的数据，请考虑使用[getApplicationSupportDirectory]。
    在Android上，它在上下文上使用`getDataDirectory` API。 如果要让用户看到数据，请考虑改用[getExternalStorageDirectory]。

    getExternalStorageDirectory
    应用程序可以访问顶级存储的目录的路径。在发出此函数调用之前，应确定当前操作系统，因为此功能仅在Android上可用。
    在iOS上，这个函数抛出一个[UnsupportedError]，因为它不可能访问应用程序的沙箱之外。
    在Android上，它使用`getExternalFilesDir（null）`。
**EncryptUtil 加解密工具类**
**ImageUtil 获取图片宽高工具类**
**JsonUtil Json工具类**
**LogUtil Log工具类**
**ObjectUtil 对象工具类**
**PickerUtil 图片选择工具类**
  Demo参考example代码
**RegexUtil 正则数据验证工具类**
**SpUtil sharedpreferences工具类**
**TextUtil 文本工具类**
**DayFormat 时间格式处理工具类**
**TimerUtil 定时器工具类**
**WidgetUtil Widget工具类 获取Rect，监听渲染**

## widget
  常用样式控件

