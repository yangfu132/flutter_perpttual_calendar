//类注释：节气
class PWBSolarTermModel {
  //节气名
  String termName;

  //日期
  DateTime termDate;

  PWBSolarTermModel(this.termName, this.termDate);

  //节气中文名称列表
  static List solarterms() {
    List solartermsList = [
      "立春",
      "雨水",
      "驚蟄",
      "春分",
      "清明",
      "驚蟄",
      "立夏",
      "小滿",
      "芒種",
      "夏至",
      "小暑",
      "大暑",
      "立秋",
      "處暑",
      "白露",
      "秋分",
      "寒露",
      "霜降",
      "立冬",
      "小雪",
      "大雪",
      "冬至",
      "小寒",
      "大寒"
    ];

    return solartermsList;
  }
}
