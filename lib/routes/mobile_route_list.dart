import 'package:mine/models/route_model.dart';

import '../common_widgets/scaffold.dart';
import '../screens/todo/student_screen.dart';


List<RouteModel> mobileRouteList = [
  
  //! home screen routes...................
  
  const RouteModel(id: 1, name: 'Student', routeName: 'mob-student', widget: CustomScaffold(childWidget: TodoScreen())),


  //! Profile screen routes...................

];
