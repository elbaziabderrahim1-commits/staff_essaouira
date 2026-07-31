import 'package:flutter/material.dart';

void main() {
  runApp(const StaffManagementApp());
}

class StaffManagementApp extends StatelessWidget {
  const StaffManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إدارة الموظفين - السجن المحلي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const EmployeeListScreen(),
    );
  }
}

class Employee {
  final String id;
  String name;
  String workCenter;
  String restDays;

  Employee({
    required this.id,
    required this.name,
    required this.workCenter,
    required this.restDays,
  });
}

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final List<Employee> _employees = [
    // الصورة 1
    Employee(id: 'EMP-1001', name: 'خلفاوي الحسين', workCenter: 'رئيس المعقل', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1002', name: 'زكرياء الكفيش', workCenter: 'نائب رئيس المعقل', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1003', name: 'البازي عبد الرحيم', workCenter: 'نائب رئيس المعقل', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1004', name: 'عبد الله بشبلا', workCenter: 'نائب رئيس المعقل', restDays: 'الخميس-الجمعة'),
    Employee(id: 'EMP-1005', name: 'علي الحراث', workCenter: 'نائب رئيس المعقل', restDays: 'الثلاثاء-الأربعاء'),
    Employee(id: 'EMP-1006', name: 'عبد الرحمان وركة', workCenter: 'التصنيف و الإيواء', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1007', name: 'سعيد الهواري', workCenter: 'ضبط سجلات باب المعقل', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1008', name: 'موسى بوري', workCenter: 'التفتيش في باب المعقل', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1009', name: 'خالد أوقاس', workCenter: 'ضبط حركة باب المعقل', restDays: 'الجمعة-السبت'),
    Employee(id: 'EMP-1010', name: 'محمد عبيد', workCenter: 'ضبط حركة باب المعقل', restDays: 'الأربعاء-الخميس'),
    Employee(id: 'EMP-1011', name: 'نور الدين جباري', workCenter: 'الخفر إلى المستشفى', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1012', name: 'عبد الحق العلمي', workCenter: 'الخفر إلى المستشفى', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1013', name: 'مهدي عزمي', workCenter: 'الخفر إلى المستشفى', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1014', name: 'بلمهدي عز الدين', workCenter: 'الخفر إلى المستشفى', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1015', name: 'خالد الغربة', workCenter: 'رئيس الحي الأول', restDays: 'الاربعاء-الخميس'),
    Employee(id: 'EMP-1016', name: 'احمد ابوزيا', workCenter: 'نائب رئيس الحي الأول', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1017', name: 'حمادي محمد', workCenter: 'الحي الأول الجناح الأول', restDays: 'الثلاثاء-الإثنين'),
    Employee(id: 'EMP-1018', name: 'ياسين اعميمي', workCenter: 'الحي الأول الجناح الأول', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1019', name: 'عبد الكريم الحنفي', workCenter: 'الحي الأول الجناح الثاني', restDays: 'الثلاثاء-الأربعاء'),
    Employee(id: 'EMP-1020', name: 'محمد حافيضي', workCenter: 'الحي الأول الجناح الثاني', restDays: 'الخميس-الجمعة'),
    Employee(id: 'EMP-1021', name: 'خالد عكوري', workCenter: 'الحي الأول الجناح الثالث', restDays: 'الثلاثاء-الأربعاء'),
    Employee(id: 'EMP-1022', name: 'التاج محمد', workCenter: 'الحي الأول الجناح الثالث', restDays: 'الخميس-الجمعة'),
    Employee(id: 'EMP-1023', name: 'ابراهيم المجدي', workCenter: 'باب الحي الأول', restDays: 'الثلاثاء-الأربعاء'),
    Employee(id: 'EMP-1024', name: 'مهدي ادراوي', workCenter: 'فسحة الحي الأول', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1025', name: 'حسن عمري', workCenter: 'رئيس الحي الثاني', restDays: 'الثلاثاء-الإثنين'),
    Employee(id: 'EMP-1026', name: 'مهدي بنعشي', workCenter: 'نائب رئيس الحي الثاني', restDays: 'الأربعاء-الخميس'),
    Employee(id: 'EMP-1027', name: 'حسن بنخديجة', workCenter: 'الجناح الأول الحي الثاني', restDays: 'الأربعاء-الخميس'),
    Employee(id: 'EMP-1028', name: 'ادريس ايت عيسى', workCenter: 'الجناح الأول الحي الثاني', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1029', name: 'هني عبد اللطيف', workCenter: 'الجناح الثاني الحي الثاني', restDays: 'الخميس-الجمعة'),
    Employee(id: 'EMP-1030', name: 'ياسين حافيضي', workCenter: 'الجناح الثاني الحي الثاني', restDays: 'الثلاثاء-الأربعاء'),
    Employee(id: 'EMP-1031', name: 'عبد العظيم فريد', workCenter: 'الجناح الثاني الحي الثاني', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1032', name: 'عمران اوحميدوش', workCenter: 'فسحة الحي الثاني', restDays: 'الثلاثاء-الأربعاء'),
    Employee(id: 'EMP-1033', name: 'وحمان يوسف', workCenter: 'رئيس الحي الثالث', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1034', name: 'محمد الكنطاري', workCenter: 'نائب رئيس الحي الثالث', restDays: 'الأربعاء-الخميس'),
    Employee(id: 'EMP-1035', name: 'مصعب بوعلام', workCenter: 'الحي الثالث الجناح الأول', restDays: 'الثلاثاء-الإثنين'),
    Employee(id: 'EMP-1036', name: 'عبد الرحمان العوفي', workCenter: 'الحي الثالث الجناح الأول', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1037', name: 'سيف الدين العبار', workCenter: 'الحي الثالث الجناح الثاني', restDays: 'السبت- الأحد'),
    Employee(id: 'EMP-1038', name: 'وليد كمال', workCenter: 'الحي الثالث الجناح الثاني', restDays: 'الخميس-الجمعة'),
    Employee(id: 'EMP-1039', name: 'رضى بنكايس', workCenter: 'الحي الثالث الجناح الثالث', restDays: 'الخميس-الجمعة'),
    Employee(id: 'EMP-1040', name: 'يونس حنيكيش', workCenter: 'الحي الثالث الجناح الثالث', restDays: 'السبت- الأحد'),

    // الصورة 2
    Employee(id: 'EMP-1041', name: 'ياسين الغلوات', workCenter: 'فسحة الحي الثالث', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1042', name: 'رضى اغفار', workCenter: 'احضار السجناء الى قاعة الزيارة', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1043', name: 'حسن بكاري', workCenter: 'التفتيش في قاعة الزيارة', restDays: 'الجمعة-السبت'),
    Employee(id: 'EMP-1044', name: 'محمد مكناوي', workCenter: 'المسؤول عن قاعة الزيارة', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1045', name: 'الموتشو عبد الفتاح', workCenter: 'باب الموظفين', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1046', name: 'الحيمر محمد', workCenter: 'باب المرتفقين', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1047', name: 'عبد الحكيم دكاير', workCenter: 'الزيارة _المواعيد_', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1048', name: 'المهدي ديباني', workCenter: 'تفتيش المؤونة', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1049', name: 'رضا نادر', workCenter: 'تفتيش الزوار', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1050', name: 'عبد الرحمان تحيري', workCenter: 'باب الحي الثالث', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1051', name: 'عزيز الديبالي', workCenter: 'الحراسة في الضبط القضائي', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1052', name: 'الرحالي مصطفى', workCenter: 'رئيس الأمن الخارجي', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1053', name: 'إلهام البجاوي', workCenter: 'تنظيم الزيارة', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1054', name: 'موني المشماشي', workCenter: 'قاعة الزيارة', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1055', name: 'نادية احموش', workCenter: 'تفتيش المؤونة', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1056', name: 'حليمة الجرموني', workCenter: 'تفتيش الزائرات', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1057', name: 'سلمى الروينكو', workCenter: 'الاستقبال و التوجيه', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1058', name: 'خديجة بلمقدم', workCenter: 'تفتيش الزائرات', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1059', name: 'حكيمة القويسري', workCenter: 'قاعة الزيارة', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1060', name: 'نادية البغادي', workCenter: 'تسلم الاموال من الزوار', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1061', name: 'عبد العزيز الصديقي', workCenter: 'نائب الأمن الخارجي', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1062', name: 'بشرى العرفاوي', workCenter: 'نائبة رئيسة حي النساء', restDays: 'الخميس-الجمعة'),
    Employee(id: 'EMP-1063', name: 'يسرى الرامي', workCenter: 'رئيسة حي النساء', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1064', name: 'فاطمة حكيمي', workCenter: 'حي النساء _التكوين_', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1065', name: 'هلودي يونس', workCenter: 'باب الإيقاف', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1066', name: 'الختاني محمد', workCenter: 'المكلف بالنظافة', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1067', name: 'اسامة بلوش', workCenter: 'فواصل الحي الثالث', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1068', name: 'رضى نور الدين', workCenter: 'البرج 4', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1069', name: 'محمد امين الناصري', workCenter: 'المكلف بالمخالفات', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1070', name: 'السقاف مهدي', workCenter: 'الملتقى 1', restDays: 'الجمعة-السبت'),
    Employee(id: 'EMP-1071', name: 'شرعا محمد', workCenter: 'الحراسة في السجن القديم', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1072', name: 'رحالي عبد الحكيم', workCenter: 'الحراسة في السجن القديم', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1073', name: 'عبد الله تنباكور', workCenter: 'الحراسة في السجن القديم', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1074', name: 'الدويبية سعيد', workCenter: 'الحراسة في السجن القديم', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1075', name: 'عبد الصمد السحيمي', workCenter: 'فواصل الحي الثالث', restDays: 'السبت-الأحد'),
    Employee(id: 'EMP-1076', name: 'عبد الصادق الصابر', workCenter: 'فواصل الحي الأول', restDays: 'الثلاثاء-الأربعاء'),
    Employee(id: 'EMP-1077', name: 'محمد عواج', workCenter: 'المداومة الليلية', restDays: 'حسب نظام المداومة'),
    Employee(id: 'EMP-1078', name: 'اجبلي خالد', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1079', name: 'طارق العبسي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1080', name: 'يونس جبور', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1081', name: 'عبد الله العلوي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1082', name: 'المفداوي المحجوب', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1083', name: 'اسامة عبو', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),

    // الصورة 3
    Employee(id: 'EMP-1084', name: 'هشام الخوخي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1085', name: 'بوغصا يوسف', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1086', name: 'امين بنعلال', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1087', name: 'يوسف صبير', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1088', name: 'يوسف عمري', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1089', name: 'شرف الدين تيكي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1090', name: 'محمد امين لوغو', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1091', name: 'امينة الكارمة', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 1', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1092', name: 'عبد الواحد السوسي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1093', name: 'العلاوي ادريس', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1094', name: 'عادل اوشاهد', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1095', name: 'عبد الفتاح الكركاكي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1096', name: 'عبد اللطيف الدحماني', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1097', name: 'ياسين لحمدي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1098', name: 'محمد ابنطير', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1099', name: 'الحسين فراج', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1100', name: 'دنيا النعامي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1101', name: 'مريم الديخ', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 2', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1102', name: 'سعيد الزنزون', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1103', name: 'باطش عبد الرحمان', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1104', name: 'حمزة الفر', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1105', name: 'عبد الاله لكحل', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1106', name: 'عثمان بوستى', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1107', name: 'اسامة اهكو', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1108', name: 'عصام بنخديجة', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1109', name: 'عمرو الهندي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1110', name: 'سفيان البغزاوي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1111', name: 'انجار عبد العزيز', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1112', name: 'امينة مهاجر', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 3', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1113', name: 'الشابني محمد', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1114', name: 'مصطفى حيمي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1115', name: 'محمد أسرار', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1116', name: 'وليد بوخيمة', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1117', name: 'العواد عبد الصمد', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1118', name: 'زكرياء جاري', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1119', name: 'المهدي الجنين', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1120', name: 'عبد الصمد امغران', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1121', name: 'ادريس المغراوي', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1122', name: 'مروان اصريحات', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1123', name: 'عبد العالي الهميص', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1124', name: 'هاجر المزوهر', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1125', name: 'حليمة أشهيبة', workCenter: 'حسب نظام الحراسة الليلية فرقة الحراسة 4', restDays: 'حسب نظام الحراسة'),
    Employee(id: 'EMP-1126', name: 'محمد السامري', workCenter: 'الحراسة في الباب الرسم', restDays: 'السبت-الأحد'),

    // الصورة 4
    Employee(id: 'EMP-1127', name: 'ايوب المغيثي', workCenter: 'باب الإيقاف', restDays: 'الاثنين -الثلاثاء'),
    Employee(id: 'EMP-1128', name: 'غير محدد', workCenter: 'غير محدد', restDays: 'غير محدد'),
    Employee(id: 'EMP-1129', name: 'غير محدد', workCenter: 'غير محدد', restDays: 'غير محدد'),
    Employee(id: 'EMP-1130', name: 'غير محدد', workCenter: 'غير محدد', restDays: 'غير محدد'),
    Employee(id: 'EMP-1131', name: 'غير محدد', workCenter: 'غير محدد', restDays: 'غير محدد'),
    Employee(id: 'EMP-1132', name: 'محمد القليعي', workCenter: 'موقوف عن العمل', restDays: 'بدون'),
    Employee(id: 'EMP-1133', name: 'محمد الصديقي', workCenter: 'التكوين المستمر', restDays: 'بدون'),
    Employee(id: 'EMP-1134', name: 'عبد الله مساعد', workCenter: 'رخصة مرضية', restDays: 'بدون'),
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredList = _employees.where((emp) {
      return emp.name.contains(_searchQuery) ||
          emp.id.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          emp.workCenter.contains(_searchQuery);
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('دليل الموظفين و أوقات الراحة'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'بحث بالاسم، الرقم الإداري أو مركز العمل...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final emp = filteredList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(emp.id.replaceAll('EMP-', '')),
                      ),
                      title: Text(
                        emp.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${emp.workCenter}\nالراحة: ${emp.restDays}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editEmployeeDialog(emp),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editEmployeeDialog(Employee emp) {
    final nameController = TextEditingController(text: emp.name);
    final centerController = TextEditingController(text: emp.workCenter);
    final restController = TextEditingController(text: emp.restDays);

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text('تعديل بيانات ${emp.id}'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'الاسم الكامل'),
                  ),
                  TextField(
                    controller: centerController,
                    decoration: const InputDecoration(labelText: 'مركز العمل'),
                  ),
                  TextField(
                    controller: restController,
                    decoration: const InputDecoration(labelText: 'راحة الأسبوع'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    emp.name = nameController.text;
                    emp.workCenter = centerController.text;
                    emp.restDays = restController.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text('حفظ'),
              ),
            ],
          ),
        );
      },
    );
  }
}
