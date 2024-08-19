import 'LunarBusiness/Foto.dart';
import 'LunarBusiness/Lunar.dart';
import 'LunarBusiness/util/FotoUtil.dart';

class PWBBuddhaBusiness {
  PWBBuddhaBusiness(DateTime theDate) {
    this.theDate = theDate.toLocal();
    lunarDate = Lunar.fromDate(this.theDate);
    foto = Foto(lunarDate);
    fotoUtil = FotoUtil();
  }
  //属性注释：日期对象
  late DateTime theDate;
  late Lunar lunarDate;
  late Foto foto;
  late FotoUtil fotoUtil;
}