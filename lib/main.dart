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
  final String id;
  final String name;
  final String adminNumber;
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
  // قائمة تجريبية للموظفين
  final List<Employee> _employees = List.generate(
    20,
    (index) => Employee(
      id: index.toString(),
      name: 'الموظف ${index + 1}',
      adminNumber: 'EMP-${1000 + index}',
      task: index % 2 == 0 ? 'مراجعة التقارير اليومية' : 'إعداد جدول المبيعات',
      restDays: index % 3 == 0 ? 'السبت، الأحد' : 'الجمعة',
    ),
  );

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = _employees.where((emp) {
      return emp.name.contains(_searchQuery) ||
          emp.adminNumber.contains(_searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة مهام الموظفين (200)'),
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
              child: ListView.builder(
                itemCount: filteredEmployees.length,
                itemBuilder: (context, index) {
                  final emp = filteredEmployees[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.shade100,
                        child: Text(emp.name[0]),
                      ),
                      title: Text(
                        '${emp.name} (${emp.adminNumber})',
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
