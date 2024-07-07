import 'package:core/model/route_models.dart';

import '../common_widgets/scaffold.dart';
import '../screens/contacts_screen/contact_screen.dart';
import '../screens/employee/employee_screen.dart';
import '../screens/student/student_screen.dart';
import '../screens/test_screens/test2.dart';

List<CoreRouteModel> mainRouteList = [
  const CoreRouteModel(id: 1, name: 'Student', routeName: 'student', widget: CustomScaffold(childWidget: StudentScreen())),
  const CoreRouteModel(id: 2, name: 'Employee', routeName: 'employee', widget: CustomScaffold(childWidget: EmployeeScreen())),
  const CoreRouteModel(id: 3, name: 'Test Two', routeName: 'test-two', widget: CustomScaffold(childWidget: TestTwo())),
  const CoreRouteModel(id: 4, name: 'Contacts', routeName: 'contact', widget: CustomScaffold(childWidget: ContactScreenScreen())),
];

List<CoreRouteModel> mobileRouteList = [
  const CoreRouteModel(id: 1, name: 'Student', routeName: 'student', widget: CustomScaffold(childWidget: StudentScreen())),
  const CoreRouteModel(id: 2, name: 'Employee', routeName: 'employee', widget: CustomScaffold(childWidget: EmployeeScreen())),
  const CoreRouteModel(id: 3, name: 'Test Two', routeName: 'test-two', widget: CustomScaffold(childWidget: TestTwo())),
  const CoreRouteModel(id: 4, name: 'Contacts', routeName: 'contact', widget: CustomScaffold(childWidget: ContactScreenScreen())),
];
