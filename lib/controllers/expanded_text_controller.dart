import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ExpandedTextController extends GetxController {
  bool _isExpanded = false;
  bool _isExpandable = false;

  bool get isExpanded => _isExpanded;
  set isExpanded(bool value) {
    _isExpanded = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  bool get isExpandable => _isExpandable;
  set isExpandable(bool value) {
    _isExpandable = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }
}
