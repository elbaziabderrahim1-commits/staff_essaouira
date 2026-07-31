import 'package:flutter/material.dart';

void main() {
  runApp(const StaffManagementApp());
}

class StaffManagementApp extends StatelessWidget {
  const StaffManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'إدارة مهام الموظفين',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const EmployeeListScreen(),
    );
  }
}

class Employee {
  String id;
  String name;
  String adminNumber;
  String task;
  String restDays;
  bool isTaskCompleted;

  Employee({
    required this.id,
    required this.name,
    required this.adminNumber,
    required this.task,
    required this.restDays,
    this.isTaskCompleted = false,
  });
}

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final List<Employee> _employees = List.generate(
    10,
    (index) => Employee(
      id: DateTime.now().millisecondsSinceEpoch.toString() + index.toString(),
      name: 'الموظف ${index + 1}',
      adminNumber: 'EMP-${1000 + index}',
      task: index % 2 == 0 ? 'مراجعة التقارير اليومية' : 'إعداد جدول المبيعات',
      restDays: index % 3 == 0 ? 'السبت، الأحد' : 'الجمعة',
    ),
  );

  String _searchQuery = '';

  void _showEmployeeDialog({Employee? employee, int? index}) {
    final nameController = TextEditingController(text: employee?.name ?? '');
    final adminNumController =
        TextEditingController(text: employee?.adminNumber ?? '');
    final taskController = TextEditingController(text: employee?.task ?? '');
    final restDaysController =
        TextEditingController(text: employee?.restDays ?? '');

    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(employee == null ? 'إضافة موظف جديد' : 'تعديل بيانات الموظف'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'اسم الموظف'),
                ),
                TextField(
                  controller: adminNumController,
                  decoration: const InputDecoration(labelText: 'الرقم الإداري'),
                ),
                TextField(
                  controller: taskController,
                  decoration: const InputDecoration(labelText: 'المهمة المكلف بها'),
                ),
                TextField(
                  controller: restDaysController,
                  decoration: const InputDecoration(
                      labelText: 'أيام الراحة الأسبوعية (مثال: الجمعة)'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {
                if (nameController.text.isEmpty ||
                    adminNumController.text.isEmpty) {
                  return;
                }
                setState(() {
                  if (employee == null) {
                    _employees.add(
                      Employee(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: nameController.text,
                        adminNumber: adminNumController.text,
                        task: taskController.text,
                        restDays: restDaysController.text,
                      ),
                    );
                  } else {
                    employee.name = nameController.text;
                    employee.adminNumber = adminNumController.text;
                    employee.task = taskController.text;
                    employee.restDays = restDaysController.text;
                  }
                });
                Navigator.of(ctx).pop();
              },
              child: Text(
                employee == null ? 'إضافة' : 'حفظ التعديلات',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteEmployee(int index) {
    setState(() {
      _employees.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = _employees.where((emp) {
      return emp.name.contains(_searchQuery) ||
          emp.adminNumber.contains(_searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('إدارة مهام الموظفين (${_employees.length})'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: InputDecoration(
                  labelText: 'بحث بالاسم أو الرقم الإداري...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: filteredEmployees.isEmpty
                  ? const Center(child: Text('لا يوجد موظفون مطايقون للبحث'))
                  : ListView.builder(
                      itemCount: filteredEmployees.length,
                      itemBuilder: (context, index) {
                        final emp = filteredEmployees[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: ListTile(
                            onTap: () => _showEmployeeDialog(
                                employee: emp, index: index),
                            leading: CircleAvatar(
                              backgroundColor: Colors.teal.shade100,
                              child: Text(
                                emp.name.isNotEmpty ? emp.name[0] : '؟',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${emp.name} (${emp.adminNumber})',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline,
                                      color: Colors.red),
                                  onPressed: () => _deleteEmployee(
                                      _employees.indexOf(emp)),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text('المهمة: ${emp.task}'),
                                Text(
                                  'أيام الراحة: ${emp.restDays}',
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Checkbox(
                              value: emp.isTaskCompleted,
                              onChanged: (val) {
                                setState(() {
                                  emp.isTaskCompleted = val ?? false;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEmployeeDialog(),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
