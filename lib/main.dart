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
  String workCenter;
  String restDays;
  bool isTaskCompleted;

  Employee({
    required this.id,
    required this.name,
    required this.adminNumber,
    required this.task,
    required this.workCenter,
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
  static const List<String> workCentersList = [
    'الكل',
    'رئاسة المعقل',
    'الحي الأول الجناح الأول',
    'الحي الأول الجناح الثاني',
    'الحي الأول الجناح الثالث',
    'باب الحي الأول',
    'فسحة الحي الأول',
    'الجناح الأول الحي الثاني',
    'الجناح الثاني الحي الثاني',
    'باب الحي الثاني',
    'فسحة الحي الثاني',
    'الجناح الأول الحي الثالث',
    'الجناح الثاني الحي الثالث',
    'الجناح الثالث الحي الثالث',
    'باب الحي الثالث',
    'فسحة الحي الثالث',
    'حي الأحداث',
    'حي النساء',
    'المطبخ',
    'المصحة',
    'مركز تداول المفاتيح والأسلحة',
    'الباب الرسمي الأمن الخارجي',
    'تنظيم الزيارة',
    'أخذ المواعيد',
    'تفتيش الزوار',
    'تفتيش المؤونة',
    'التفتيش في قاعة الزيارة',
    'المراقبة بقاعة الزيارة',
    'إحضار السجناء إلى قاعة الزيارة',
  ];

  static const List<String> restDaysList = [
    'الكل',
    'السبت',
    'الأحد',
    'الجمعة',
    'الخميس',
    'الأربعاء',
    'الثلاثاء',
    'الإثنين',
  ];

  late List<Employee> _employees;
  String _searchQuery = '';
  String _selectedWorkCenter = 'الكل';
  String _selectedRestDay = 'الكل';

  @override
  void initState() {
    super.initState();
    _employees = [];
    int empCounter = 1;

    // توليد موظفين موزعين على المراكز (على الأقل 10 لكل مركز)
    for (var i = 1; i < workCentersList.length; i++) {
      String center = workCentersList[i];
      for (var j = 1; j <= 10; j++) {
        String restDay;
        if (empCounter % 4 == 0) {
          restDay = 'السبت و الأحد';
        } else if (empCounter % 4 == 1) {
          restDay = 'الجمعة';
        } else if (empCounter % 4 == 2) {
          restDay = 'الخميس و الجمعة';
        } else {
          restDay = 'الثلاثاء و الأربعاء';
        }

        _employees.add(Employee(
          id: empCounter.toString(),
          name: 'موظف $empCounter',
          adminNumber: '${1000 + empCounter}',
          task: 'حراسة ومراقبة $center',
          workCenter: center,
          restDays: restDay,
        ));
        empCounter++;
      }
    }
  }

  void _showEmployeeDialog({Employee? employee}) {
    final nameController = TextEditingController(text: employee?.name ?? '');
    final adminNumController =
        TextEditingController(text: employee?.adminNumber ?? '');
    final taskController = TextEditingController(text: employee?.task ?? '');
    final restDaysController =
        TextEditingController(text: employee?.restDays ?? '');
    String selectedCenterInDialog =
        employee?.workCenter ?? workCentersList[1];

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Text(employee == null
                  ? 'إضافة موظف جديد'
                  : 'تعديل بيانات الموظف'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(labelText: 'اسم الموظف'),
                    ),
                    TextField(
                      controller: adminNumController,
                      decoration:
                          const InputDecoration(labelText: 'الرقم الإداري'),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedCenterInDialog,
                      decoration:
                          const InputDecoration(labelText: 'مركز العمل'),
                      items: workCentersList
                          .where((c) => c != 'الكل')
                          .map((c) => DropdownMenuItem(
                                value: c,
                                child: Text(c,
                                    style: const TextStyle(fontSize: 13)),
                              ))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setDialogState(() => selectedCenterInDialog = val);
                        }
                      },
                    ),
                    TextField(
                      controller: taskController,
                      decoration:
                          const InputDecoration(labelText: 'المهمة المكلف بها'),
                    ),
                    TextField(
                      controller: restDaysController,
                      decoration: const InputDecoration(
                          labelText: 'أيام الراحة الأسبوعية'),
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
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            name: nameController.text,
                            adminNumber: adminNumController.text,
                            workCenter: selectedCenterInDialog,
                            task: taskController.text,
                            restDays: restDaysController.text,
                          ),
                        );
                      } else {
                        employee.name = nameController.text;
                        employee.adminNumber = adminNumController.text;
                        employee.workCenter = selectedCenterInDialog;
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
          );
        },
      ),
    );
  }

  void _deleteEmployee(Employee emp) {
    setState(() {
      _employees.remove(emp);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = _employees.where((emp) {
      final matchesSearch = emp.name.contains(_searchQuery) ||
          emp.adminNumber.contains(_searchQuery);

      final matchesCenter = _selectedWorkCenter == 'الكل' ||
          emp.workCenter == _selectedWorkCenter;

      final matchesRestDay = _selectedRestDay == 'الكل' ||
          emp.restDays.contains(_selectedRestDay);

      return matchesSearch && matchesCenter && matchesRestDay;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('إدارة الموظفين (${filteredEmployees.length}/${_employees.length})'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // شريط البحث
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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

            // فلترة حسب أيام الراحة الأسبوعية
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restDaysList.length,
                itemBuilder: (ctx, idx) {
                  final day = restDaysList[idx];
                  final isSelected = _selectedRestDay == day;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: FilterChip(
                      label: Text(day == 'الكل' ? 'كل أيام الراحة' : day),
                      selected: isSelected,
                      selectedColor: Colors.teal.shade200,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedRestDay = selected ? day : 'الكل';
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            // فلترة حسب مركز العمل
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: DropdownButtonFormField<String>(
                value: _selectedWorkCenter,
                decoration: InputDecoration(
                  labelText: 'تصفية حسب مركز العمل',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: workCentersList
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c, style: const TextStyle(fontSize: 14)),
                        ))
                    .toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() => _selectedWorkCenter = val);
                  }
                },
              ),
            ),

            const Divider(),

            // قائمة الموظفين
            Expanded(
              child: filteredEmployees.isEmpty
                  ? const Center(
                      child: Text('لا يوجد موظفون مطابقون لشروط البحث'))
                  : ListView.builder(
                      itemCount: filteredEmployees.length,
                      itemBuilder: (context, index) {
                        final emp = filteredEmployees[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: ListTile(
                            onTap: () => _showEmployeeDialog(employee: emp),
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
                                  onPressed: () => _deleteEmployee(emp),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 2),
                                Text('مركز العمل: ${emp.workCenter}',
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold)),
                                Text('المهمة: ${emp.task}'),
                                Text(
                                  'أيام الراحة: ${emp.restDays}',
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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
