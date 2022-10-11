class Util {
  static String intToMM(int str) {
    String converted;
    converted = str.toString().replaceAll(RegExp('0'), "၀");
    converted = converted.replaceAll(RegExp('1'), "၁");
    converted = converted.replaceAll(RegExp('2'), "၂");
    converted = converted.replaceAll(RegExp('3'), "၃");
    converted = converted.replaceAll(RegExp('4'), "၄");
    converted = converted.replaceAll(RegExp('5'), "၅");
    converted = converted.replaceAll(RegExp('6'), "၆");
    converted = converted.replaceAll(RegExp('7'), "၇");
    converted = converted.replaceAll(RegExp('8'), "၈");
    converted = converted.replaceAll(RegExp('9'), "၉");

    return converted;
  }
}
