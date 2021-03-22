import 'PWBElementModel.dart';
import 'PWBSkyTrunkModel.dart';

//子=0,丑,寅,卯,辰,巳,午,未,申,酉,戌,亥,
enum PWBEarchBranchEnum {
  ZI, //子
  CHOU, //丑
  YIN, //寅
  MAO, //卯
  CHEN, //辰
  SI, //巳
  WU, //午
  WEI, //未
  SHEN, //申
  YOU, //酉
  XU, //戌
  HAI, //亥
}

//鼠=0,牛,虎,兔,龍,蛇,馬,羊,猴,雞,狗,豬,
enum PWBShengXiaoEnum {
  SHU, //鼠
  NIU, //牛
  HU, //虎
  TU, //兔
  LONG, //龍
  SHE, //蛇
  MA, //馬
  YANG, //羊
  HOU, //猴
  JI, //雞
  GOU, //狗
  ZHU, //豬
}

//类注释：地支模型
class PWBEarthBranchModel {
  PWBEarthBranchModel(this.value);
  PWBEarchBranchEnum value;

  //方法注释：地支中文名
  String? stringName() {
    // 子=0,丑,寅,卯,辰,巳,午,未,申,酉,戌,亥,
    String? result;
    switch (this.value) {
      case PWBEarchBranchEnum.ZI: //子
        {
          result = "子";
          break;
        }
      case PWBEarchBranchEnum.CHOU: //丑
        {
          result = "丑";
          break;
        }
      case PWBEarchBranchEnum.YIN: //寅
        {
          result = "寅";
          break;
        }
      case PWBEarchBranchEnum.MAO: //卯
        {
          result = "卯";
          break;
        }
      case PWBEarchBranchEnum.CHEN: //辰
        {
          result = "辰";
          break;
        }
      case PWBEarchBranchEnum.SI: //巳
        {
          result = "巳";
          break;
        }
      case PWBEarchBranchEnum.WU: //午
        {
          result = "午";
          break;
        }
      case PWBEarchBranchEnum.WEI: //未
        {
          result = "未";
          break;
        }
      case PWBEarchBranchEnum.SHEN: //申
        {
          result = "申";
          break;
        }
      case PWBEarchBranchEnum.YOU: //酉
        {
          result = "酉";
          break;
        }
      case PWBEarchBranchEnum.XU: //戌
        {
          result = "戌";
          break;
        }
      case PWBEarchBranchEnum.HAI: //亥
        {
          result = "亥";
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

    return result;
  }

  //方法注释：地支的五行分类
  PWBElementModel? elementValue() {
    // 子=0,丑,寅,卯,辰,巳,午,未,申,酉,戌,亥,
    PWBElementModel? result;
    switch (this.value) {
      case PWBEarchBranchEnum.YIN: //寅
      case PWBEarchBranchEnum.MAO: //卯
        {
          result = PWBElementModel(PWBElementEnum.MU);
          break;
        }
      case PWBEarchBranchEnum.SI: //巳
      case PWBEarchBranchEnum.WU: //午
        {
          result = PWBElementModel(PWBElementEnum.HUO);
          break;
        }
      case PWBEarchBranchEnum.SHEN: //申
      case PWBEarchBranchEnum.YOU: //酉
        {
          result = PWBElementModel(PWBElementEnum.JIN);
          break;
        }
      case PWBEarchBranchEnum.HAI: //亥
      case PWBEarchBranchEnum.ZI: //子
        {
          result = PWBElementModel(PWBElementEnum.SHUI);
          break;
        }
      case PWBEarchBranchEnum.CHEN: //辰
      case PWBEarchBranchEnum.XU: //戌
      case PWBEarchBranchEnum.CHOU: //丑
      case PWBEarchBranchEnum.WEI: //未
        {
          result = PWBElementModel(PWBElementEnum.TU);
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

  //方法注释：地支的生肖对应
  String? shengxiaoValue() {
    // 子=0,丑,寅,卯,辰,巳,午,未,申,酉,戌,亥,
    String? result;
    switch (this.value) {
      case PWBEarchBranchEnum.ZI: //子
        {
          result = "鼠";
          break;
        }
      case PWBEarchBranchEnum.CHOU: //丑
        {
          result = "牛";
          break;
        }
      case PWBEarchBranchEnum.YIN: //寅
        {
          result = "虎";
          break;
        }
      case PWBEarchBranchEnum.MAO: //卯
        {
          result = "兔";
          break;
        }
      case PWBEarchBranchEnum.CHEN: //辰
        {
          result = "龍";
          break;
        }
      case PWBEarchBranchEnum.SI: //巳
        {
          result = "蛇";
          break;
        }
      case PWBEarchBranchEnum.WU: //午
        {
          result = "馬";
          break;
        }
      case PWBEarchBranchEnum.WEI: //未
        {
          result = "羊";
          break;
        }
      case PWBEarchBranchEnum.SHEN: //申
        {
          result = "猴";
          break;
        }
      case PWBEarchBranchEnum.YOU: //酉
        {
          result = "雞";
          break;
        }
      case PWBEarchBranchEnum.XU: //戌
        {
          result = "狗";
          break;
        }
      case PWBEarchBranchEnum.HAI: //亥
        {
          result = "豬";
          break;
        }
      default:
        {
          //1 == 2 的写法有不妥之处，不能表达含义；
          //此处的意思是default为异常分支，应该为colog
          assert(1 == 2, 'shengxiaoValue:${this.value}');
          break;
        }
    }

    return result;
  }

  //方法注释：藏干
  List<PWBSkyTrunkModel>? skytrunkValue() {
    List<PWBSkyTrunkModel>? result;
    switch (this.value) {
      case PWBEarchBranchEnum.ZI: //子
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.GUI), //癸
          ];
          break;
        }
      case PWBEarchBranchEnum.CHOU: //丑
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.JI), //己
            PWBSkyTrunkModel(PWBSkyTrunkEnum.GUI), //癸
            PWBSkyTrunkModel(PWBSkyTrunkEnum.XIN), //辛
          ];
          break;
        }
      case PWBEarchBranchEnum.YIN: //寅
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.JIA), //甲
            PWBSkyTrunkModel(PWBSkyTrunkEnum.BING), //丙
            PWBSkyTrunkModel(PWBSkyTrunkEnum.WU), //戊
          ];
          break;
        }
      case PWBEarchBranchEnum.MAO: //卯
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.YI), //乙
          ];
          break;
        }
      case PWBEarchBranchEnum.CHEN: //辰
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.WU), //戊
            PWBSkyTrunkModel(PWBSkyTrunkEnum.YI), //乙
            PWBSkyTrunkModel(PWBSkyTrunkEnum.GUI), //癸
          ];
          break;
        }
      case PWBEarchBranchEnum.SI: //巳
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.BING), //丙
            PWBSkyTrunkModel(PWBSkyTrunkEnum.WU), //戊
            PWBSkyTrunkModel(PWBSkyTrunkEnum.GENG), //庚
          ];
          break;
        }
      case PWBEarchBranchEnum.WU: //午
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.DING), //丁
            PWBSkyTrunkModel(PWBSkyTrunkEnum.JI), //己
          ];
          break;
        }
      case PWBEarchBranchEnum.WEI: //未
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.JI), //己
            PWBSkyTrunkModel(PWBSkyTrunkEnum.DING), //丁
            PWBSkyTrunkModel(PWBSkyTrunkEnum.YI), //乙
          ];
          break;
        }
      case PWBEarchBranchEnum.SHEN: //申
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.GENG), //庚
            PWBSkyTrunkModel(PWBSkyTrunkEnum.REN), //壬
            PWBSkyTrunkModel(PWBSkyTrunkEnum.WU), //戊
          ];
          break;
        }
      case PWBEarchBranchEnum.YOU: //酉
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.XIN), //辛
          ];
          break;
        }
      case PWBEarchBranchEnum.XU: //戌
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.WU), //戊
            PWBSkyTrunkModel(PWBSkyTrunkEnum.XIN), //辛
            PWBSkyTrunkModel(PWBSkyTrunkEnum.DING), //丁
          ];
          break;
        }
      case PWBEarchBranchEnum.HAI: //亥
        {
          result = [
            PWBSkyTrunkModel(PWBSkyTrunkEnum.REN), //壬
            PWBSkyTrunkModel(PWBSkyTrunkEnum.JIA), //甲
          ];
          break;
        }
      default:
        {
          //1 == 2 的写法有不妥之处，不能表达含义；
          //此处的意思是default为异常分支，应该为colog
          assert(1 == 2, 'skytrunkValue:${this.value}');
          break;
        }
    }

    return result;
  }

  static List<String> earthBranch() {
    return ["子", "丑", "寅", "末", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"];
  }
}
