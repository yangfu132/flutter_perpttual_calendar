//十神
const int TenGod_BiJian = 1; //比肩
const int TenGod_JieCai = -1; //劫財

const int TenGod_ShiShen = 2; //食神
const int TenGod_ShangGuan = -2; //伤官

const int TenGod_PianCai = 3; //偏财
const int TenGod_ZhengCai = -3; //正财

const int TenGod_QiSha = 1; //七杀
const int TenGod_ZhengGuan = 1; //正官

const int TenGod_PianYin = 1; //偏印
const int TenGod_ZhengYin = 1; //正印

//类注释：十神模型
class PWBTenGodModel {
  PWBTenGodModel(this.value);
  int value;

  //方法注释：十神的中文名称
  String stringName() {
    String result;
    switch (this.value) {
      case TenGod_BiJian: // 比肩
        {
          result = "比肩";
          break;
        }
      case TenGod_JieCai: // 劫財
        {
          result = "劫財";
          break;
        }
      case TenGod_ShiShen: // 食神
        {
          result = "食神";
          break;
        }
      case TenGod_ShangGuan: // 傷官
        {
          result = "傷官";
          break;
        }
      case TenGod_PianCai: // 偏財
        {
          result = "偏財";
          break;
        }
      case TenGod_ZhengCai: // 正財
        {
          result = "正財";
          break;
        }
      case TenGod_QiSha: // 七殺
        {
          result = "七殺";
          break;
        }
      case TenGod_ZhengGuan: // 正官
        {
          result = "正官";
          break;
        }
      case TenGod_PianYin: // 偏印
        {
          result = "偏印";
          break;
        }
      case TenGod_ZhengYin: // 正印
        {
          result = "正印";
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

  //方法注释：十神的中文简称
  String shortName() {
    String result;
    switch (this.value) {
      case TenGod_BiJian: // 比肩
        {
          result = "比";
          break;
        }
      case TenGod_JieCai: // 劫財
        {
          result = "劫";
          break;
        }
      case TenGod_ShiShen: // 食神
        {
          result = "食";
          break;
        }
      case TenGod_ShangGuan: // 傷官
        {
          result = "傷";
          break;
        }
      case TenGod_PianCai: // 偏財
        {
          result = "才";
          break;
        }
      case TenGod_ZhengCai: // 正財
        {
          result = "財";
          break;
        }
      case TenGod_QiSha: // 七殺
        {
          result = "殺";
          break;
        }
      case TenGod_ZhengGuan: // 正官
        {
          result = "官";
          break;
        }
      case TenGod_PianYin: // 偏印
        {
          result = "偏";
          break;
        }
      case TenGod_ZhengYin: // 正印
        {
          result = "印";
          break;
        }
      default:
        {
          //1 == 2 的写法有不妥之处，不能表达含义；
          //此处的意思是default为异常分支,应该为colog
          assert(1 == 2, 'shortName:${this.value}');
          break;
        }
    }

    return result;
  }

  //方法注释：十神的中文名称，展示时需要竖着展示
  String verticalName() {
    String result;
    switch (this.value) {
      case TenGod_BiJian: // 比肩
        {
          result = "比\n肩";
          break;
        }
      case TenGod_JieCai: // 劫財
        {
          result = "劫\n財";
          break;
        }
      case TenGod_ShiShen: // 食神
        {
          result = "食\n神";
          break;
        }
      case TenGod_ShangGuan: // 傷官
        {
          result = "傷\n官";
          break;
        }
      case TenGod_PianCai: // 偏財
        {
          result = "偏\n財";
          break;
        }
      case TenGod_ZhengCai: // 正財
        {
          result = "正\n財";
          break;
        }
      case TenGod_QiSha: // 七殺
        {
          result = "七\n殺";
          break;
        }
      case TenGod_ZhengGuan: // 正官
        {
          result = "正\n官";
          break;
        }
      case TenGod_PianYin: // 偏印
        {
          result = "偏\n印";
          break;
        }
      case TenGod_ZhengYin: // 正印
        {
          result = "正\n印";
          break;
        }
      default:
        {
          //1 == 2 的写法有不妥之处，不能表达含义；
          //此处的意思是default为异常分支,应该为colog
          assert(1 == 2, 'verticalName:${this.value}');
          break;
        }
    }

    return result;
  }
}
