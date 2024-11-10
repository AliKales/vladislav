extension ExtIntNull on int? {
  bool get isTrue {
    if (this == 1) return true;
    return false;
  }
  
  bool get isFalse {
    if (this == 0) return true;
    return false;
  }
}
