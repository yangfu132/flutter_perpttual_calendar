import 'package:flutter/material.dart';

enum PWBElementEnum {
  MU, //木
  HUO, //火
  TU, //土
  JIN, //金
  SHUI, //水
}

//类注释：五行模型
class PWBElementModel {
  PWBElementModel(this.value);
  PWBElementEnum value;

  //方法注释：五行代表的颜色
  Color colorValue() {
    Color result;
    switch (this.value) {
      case PWBElementEnum.MU:
        {
          result = Colors.green;
          break;
        }
      case PWBElementEnum.HUO:
        {
          result = Colors.red;
          break;
        }
      case PWBElementEnum.TU:
        {
          result = Colors.brown;
          break;
        }
      case PWBElementEnum.JIN:
        {
          result = Colors.orange;
          break;
        }
      case PWBElementEnum.SHUI:
        {
          result = result = Colors.blue;
          break;
        }
      default:
        {
          result = result = Colors.grey;
          break;
        }
    }

    return result;
  }

  //方法注释：五行的中文名
  String? stringName() {
    String? result;
    switch (this.value) {
      case PWBElementEnum.MU:
        {
          result = "木";
          break;
        }
      case PWBElementEnum.HUO:
        {
          result = "火";
          break;
        }
      case PWBElementEnum.TU:
        {
          result = "土";
          break;
        }
      case PWBElementEnum.JIN:
        {
          result = "金";
          break;
        }
      case PWBElementEnum.SHUI:
        {
          result = "水";
          break;
        }
      default:
        {
          //1 == 2 的写法有不妥之处，不能表达含义；
          //此处的意思是default为异常分支，应该为colog
          assert(1 == 2, 'stringName:${this.value}');
          break;
        }
    }
    ;

    return result;
  }
}
