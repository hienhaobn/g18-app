import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/input_text.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/ui/account_page/account_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

//báo cáo nhân sự
class PersonalReport extends StatefulWidget {
  const PersonalReport({super.key});

  @override
  State<PersonalReport> createState() => _PersonalReportState();
}

class _PersonalReportState extends State<PersonalReport> {
  @override
  AccountPageController get controller => Get.put(AccountPageController());

  late EmployeeDataSource _employeeDataSource;
  @override
  void initState() {
    _employeeDataSource = EmployeeDataSource(employeeData: getEmployeeData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quản lý nhân sự',
          style: controller.fontController.currentFontStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        backgroundColor: Color(0xFF4C28A5),
        centerTitle: true, // Đặt tiêu đề ở giữa
        leading: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.only(left: 15),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 24),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          10.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InputText(
              padding: EdgeInsets.symmetric(horizontal: 15),
              hintText: "Nhập thông tin tìm kiếm tại đây",
              iconPrefix: Icon(Icons.search),
            ),
          ),
          15.height,

          // bảng
          Expanded(
            child: SfDataGrid(
              source: _employeeDataSource,
              frozenColumnsCount: 1, // Cột STT cố định
              frozenRowsCount: 0, // Hàng tiêu đề cố định
              columns: [
                GridColumn(
                  width: 50,
                  columnName: 'STT',
                  label: Container(
                    color: AppColors.p4C28A5,
                    width: 50,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      'STT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                GridColumn(
                  width: 150,
                  columnName: 'id',
                  label: Container(
                    color: AppColors.p4C28A5,
                    width: 150,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      'id',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                GridColumn(
                  width: 150,
                  columnName: '',
                  label: Container(
                    color: AppColors.p4C28A5,
                    width: 150,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      'tên',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                GridColumn(
                  width: 150,
                  columnName: '',
                  label: Container(
                    color: AppColors.p4C28A5,
                    width: 150,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text('tuổi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                GridColumn(
                  width: 150,
                  columnName: '',
                  label: Container(
                    color: AppColors.p4C28A5,
                    width: 150,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text('họ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                GridColumn(
                  columnName: 'lop',
                  width: 150, // Tăng chiều rộng cột lên 150
                  label: Container(
                    color: AppColors.p4C28A5,

                    width: 150, // Đồng bộ chiều rộng cho header
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      'Lớp',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return List.generate(
      999,
      (index) => Employee(
        stt: index + 1,
        name: 'Employee $index',
        designation: 'Designation $index',
      ),
    );
  }
}

//-------

class Employee {
  Employee({required this.stt, required this.name, required this.designation});
  final int stt;
  final String name;
  final String designation;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employeeData}) {
    _dataGridRows = employeeData
        .map<DataGridRow>((data) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'STT', value: data.stt),
              DataGridCell<String>(columnName: 'Name', value: data.name),
              DataGridCell<String>(
                  columnName: 'Designation1', value: data.designation),
              DataGridCell<String>(
                  columnName: 'Designation2', value: data.designation),
              DataGridCell<String>(
                  columnName: 'Designation3', value: data.designation),
              DataGridCell<String>(
                  columnName: 'Designation4', value: data.designation),
            ]))
        .toList();
  }

  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataCell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(dataCell.value.toString()),
        );
      }).toList(),
    );
  }
}
