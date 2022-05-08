class CurrencyText {
  String format(double nominal) {
    String text = nominal.toStringAsFixed(0);

    if (text.length > 3 && text.length <= 6) {
      return text.replaceAll(RegExp('000'), '') + ' ribu';
    } else if (text.length > 6 && text.length <= 9) {
      return text.replaceAll(RegExp('000000'), '') + ' juta';
    } else if (text.length > 9 && text.length <= 12) {
      return text.replaceAll(RegExp('000000000'), '') + ' milyar';
    } else {
      return text.replaceAll(RegExp('000000000000'), '') + ' trilyun';
    }
  }
}
