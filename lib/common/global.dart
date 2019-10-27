import 'package:flutter/material.dart';
import 'package:hello_flutter/common/git_api.dart';
import 'package:hello_flutter/common/net_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hello_flutter/models/cacheConfig.dart';
import 'dart:convert';
import '../models/index.dart';
import 'package:hello_flutter/models/profile.dart';

// 提供五套可选主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  // 网络缓存对象
  static NetCache netCache = NetCache();

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    print('profile $_profile');
    // 初始未缓存状态下 _profile为null
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }

    // 如果没有缓存策略，设置默认缓存策略
    // 第一次的时候 这里肯定是没有缓存策略的, 所以会默认走到CacheConfig
    // CacheConfig实际上是我们之前通过json_format生成的一个json的对象, 其参数有: 
    // enable  maxAge  maxCount
    // 因此这里相当于给其设置了CacheConfig的值, 且给CacheConfig本身又赋了一次值
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    //初始化网络请求相关配置
    Git.init();
  }

  // 持久化Profile信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}
