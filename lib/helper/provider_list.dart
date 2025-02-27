import 'package:project/view_model/todo_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (_) => TodoVm()),
];
