import 'PWBElementModel.dart';

///术语表：
///SkyTrunk：天干
///Element:五行
///

enum PWBSkyTrunkEnum {
  JIA, //甲
  YI, //乙
  BING, //丙
  DING, //丁
  WU, //戊
  JI, //己
  GENG, //庚
  XIN, //辛
  REN, //壬
  GUI, //癸
}

//类注释：天干模型
class PWBSkyTrunkModel {
  PWBSkyTrunkModel(this.value);
  PWBSkyTrunkEnum value;

  // 天干名
  String stringName() {
    String result;
    switch (this.value) {
      case PWBSkyTrunkEnum.JIA:
        {
          result = "甲";
          break;
        }
      case PWBSkyTrunkEnum.BING:
        {
          result = "丙";
          break;
        }
      case PWBSkyTrunkEnum.WU:
        {
          result = "戊";
          break;
        }
      case PWBSkyTrunkEnum.GENG:
        {
          result = "庚";
          break;
        }
      case PWBSkyTrunkEnum.REN:
        {
          result = "壬";
          break;
        }
      case PWBSkyTrunkEnum.YI:
        {
          result = "乙";
          break;
        }
      case PWBSkyTrunkEnum.DING:
        {
          result = "丁";
          break;
        }
      case PWBSkyTrunkEnum.JI:
        {
          result = "己";
          break;
        }
      case PWBSkyTrunkEnum.XIN:
        {
          result = "辛";
          break;
        }
      case PWBSkyTrunkEnum.GUI:
        {
          result = "癸";
          break;
        }
      default:
        {
          //1 == 2 的写法有不妥之处，不能表达含义；
          //此处的意思是default为异常分支,应该为colog
          assert(1 == 2, 'stringName:${this.value}');
          break;
        }
    }

    return result;
  }

//方法注释：五行
  PWBElementModel elementValue() {
    PWBElementModel result;
    switch (this.value) {
      case PWBSkyTrunkEnum.JIA: //甲
      case PWBSkyTrunkEnum.YI: //乙
        {
          result = PWBElementModel(PWBElementEnum.MU);
          break;
        }
      case PWBSkyTrunkEnum.BING: //丙
      case PWBSkyTrunkEnum.DING: //丁
        {
          result = PWBElementModel(PWBElementEnum.HUO);
          break;
        }
      case PWBSkyTrunkEnum.WU: //戊
      case PWBSkyTrunkEnum.JI: //己
        {
          result = PWBElementModel(PWBElementEnum.TU);
          break;
        }
      case PWBSkyTrunkEnum.GENG: //庚
      case PWBSkyTrunkEnum.XIN: //辛
        {
          result = PWBElementModel(PWBElementEnum.JIN);
          break;
        }
      case PWBSkyTrunkEnum.REN: //壬
      case PWBSkyTrunkEnum.GUI: //癸
        {
          result = PWBElementModel(PWBElementEnum.SHUI);
          break;
        }
      default:
        {
          //1 == 2 的写法有不妥之处，不能表达含义；
          //此处的意思是default为异常分支，应该为colog
          assert(1 == 2, 'elementValue:${this.value}');
          break;
        }
    }

    return result;
  }

  //方法注释：计算十神的基本值，阳干为正，阴干为负
  int biValue() {
    int result = 0;
    switch (this.value) {
      case PWBSkyTrunkEnum.JIA: // 甲
      case PWBSkyTrunkEnum.BING: // 丙
      case PWBSkyTrunkEnum.WU: // 戊
      case PWBSkyTrunkEnum.GENG: // 庚
      case PWBSkyTrunkEnum.REN: // 癸
        {
          result = 1;
          break;
        }
      case PWBSkyTrunkEnum.YI: // 乙
      case PWBSkyTrunkEnum.DING: // 丁
      case PWBSkyTrunkEnum.JI: // 己
      case PWBSkyTrunkEnum.XIN: // 辛
      case PWBSkyTrunkEnum.GUI: // 癸
        {
          result = -1;
          break;
        }
      default:
        {
          //1 == 2 的写法有不妥之处，不能表达含义；
          //此处的意思是default为异常分支,应该为colog
          assert(1 == 2, 'biValue:${this.value}');
          break;
        }
    }

    return result;
  }

  static List<String> skyTrunk() {
    return ["甲", "乙", "丙", "丁", "午", "己", "庚", "辛", "壬", "癸"];
  }
}
