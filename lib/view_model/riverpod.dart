import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contacts_vm.dart';
import 'employee_vm.dart';
import 'login_vm.dart';
import 'student_vm.dart';

final studentVM = ChangeNotifierProvider<StudentVM>((ref) => StudentVM());
final employeeVM = ChangeNotifierProvider<EmployeeVm>((ref) => EmployeeVm());
final contactVM = ChangeNotifierProvider<ContactsViewModel>((ref) => ContactsViewModel());
final loginVM = ChangeNotifierProvider<LoginVM>((ref) => LoginVM());
