import 'package:mine/models/route_model.dart';

import '../common_widgets/scaffold.dart';
import '../screens/student/student_screen.dart';


List<RouteModel> mobileRouteList = [
  
  //! home screen routes...................
  
  const RouteModel(id: 1, name: 'Student', routeName: 'mob-student', widget: CustomScaffold(childWidget: StudentScreen())),
  // const RouteModel(id: 2, name: 'Employee', routeName: 'mob-employee', widget: CustomScaffold(childWidget: EmployeeScreen())),
  // const RouteModel(id: 4, name: 'Contacts', routeName: 'mob-contact', widget: CustomScaffold(childWidget: ContactScreenScreen())),

  //! Profile screen routes...................

];
