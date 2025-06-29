extension StringHelper on int {
  String countSimplify() {
    if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(this % 1000000000 == 0 ? 0 : 1)}B';
    } else if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(this % 1000000 == 0 ? 0 : 1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(this % 1000 == 0 ? 0 : 1)}k';
    } else {
      return toString();
    }
  }
}
