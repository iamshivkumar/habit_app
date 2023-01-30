import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loadingProvider = ChangeNotifierProvider((ref) => Loading());

class Loading extends ChangeNotifier {
  bool loading = false;

  void start() {
    loading = true;
    notifyListeners();
  }

  void stop() {
    loading = false;
    notifyListeners();
  }

  void end() {
    loading = false;
  }
}
