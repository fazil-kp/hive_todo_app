import 'package:mine/models/route_model.dart';

import '../common_widgets/scaffold.dart';
import '../screens/student/student_screen.dart';


List<RouteModel> mainRouteList = [
  const RouteModel(id: 1, name: 'Student', routeName: 'student', widget: CustomScaffold(childWidget: StudentScreen())),
  // const RouteModel(id: 2, name: 'Employee', routeName: 'employee', widget: CustomScaffold(childWidget: EmployeeScreen())),
  // const RouteModel(id: 4, name: 'Contacts', routeName: 'contact', widget: CustomScaffold(childWidget: ContactScreenScreen())),
];
