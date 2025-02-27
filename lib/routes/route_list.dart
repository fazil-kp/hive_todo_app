import 'package:mine/models/route_model.dart';
import 'package:project/view_model/todo_vm.dart';
import 'package:provider/provider.dart';

import '../common_widgets/scaffold.dart';
import '../screens/todo/student_screen.dart';

class MainRoute {
  static List<RouteModel> mainRouteList = [
    RouteModel(id: 1, name: 'Student', routeName: 'student', widget: ChangeNotifierProvider(create: (_) => TodoVm(), child: const CustomScaffold(childWidget: TodoScreen()))),
  ];
}
