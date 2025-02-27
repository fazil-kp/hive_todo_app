import 'package:project/view_model/todo_vm.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider(create: (_) => TodoVm()),
];
