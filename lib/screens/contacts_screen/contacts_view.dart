// import 'package:core/widgets/core_custom_table.dart';
// import 'package:core/widgets/core_main_widget.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nb_utils/nb_utils.dart';

// import '../../../view_model/riverpod.dart';

// class ContactsViewTable extends ConsumerWidget {
//   const ContactsViewTable({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MainWidget(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           // CustomTextField(
//           //   hintText: "Search",
//           //   prefixIcon: Icon(Icons.search, color: ColorCode.colorList(context).blackWhite?.withOpacity(.5)),
//           //   value: ref.read(contactVM).searchFilter,
//           //   onChanged: (val) {
//           //     ref.read(contactVM).searchFilter = val;
//           //     ref.read(contactVM).search();
//           //     ref.read(contactVM).refresh();
//           //   },
//           // ),
//           20.height,
//           CustomDataTable(
//             columns: const [
//               DataColumn2(label: Text('id')),
//               DataColumn2(label: Text('Name')),
//               DataColumn2(label: Text('Email')),
//               DataColumn2(label: Text('Phone')),
//             ],
//             rows: [
//               ...ref.watch(contactVM).contactModelList.data.map(
//                 (e) {
//                   return DataRow2(
//                     color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
//                       if (states.contains(WidgetState.selected)) {
//                         return Theme.of(context).colorScheme.primary.withOpacity(0.08);
//                       }
//                       if (e.id == ref.read(contactVM).contactModel.id) {
//                         return Theme.of(context).colorScheme.primary.withOpacity(0.08);
//                       }
//                       return null;
//                     }),
//                     specificRowHeight: 50,
//                     selected: e.id == ref.read(contactVM).contactModel.id,
//                     onTap: () {
//                       ref.read(contactVM).contactModel = e;
//                       ref.read(contactVM).refresh();
//                     },
//                     cells: [
//                       DataCell(Text(e.id.toString())),
//                       DataCell(Text(e.name ?? '')),
//                       DataCell(Text(e.email ?? '')),
//                       DataCell(Text(e.phone == null ? '' : e.phone.toString())),
//                     ],
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
