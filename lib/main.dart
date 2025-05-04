import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/project_images.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),

      theme: ThemeData(
        iconTheme: IconThemeData(color: Color(0xFF9CACBC), size: 30),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),

        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),

          bodySmall: TextStyle(fontSize: 14, color: Color(0xFF59616C)),

          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String name = "Ирина";
    String doctor = "Стоматолог";

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            SizedBox(width: 20),
            Text("Новый документ"),
          ],
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey, height: 1.0),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  ProjectImages.image,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: BodyPart(
                      icon: Icons.person_outlined,
                      text1: name,
                      text2: "",
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: BodyPart(
                      icon: Icons.calendar_today_outlined,
                      text1: "22 мая (вт), 16:00",
                      text2: "Дата получения документов",
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: BodyPart(
                      icon: Icons.location_on_outlined,
                      text1: "Клиника «Фомина»",
                      text2: "Бульвар Перервинский, д. 4",
                    ),
                  ),

                  BodyPart(
                    icon: Icons.medical_information_outlined,
                    text1: doctor,
                    text2: "",
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFF2D9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 85,
                      right: -25,
                      child: Icon(
                        Icons.info_outline,
                        color: Color(0xFFF9D2AE),
                        size: 80,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Text(
                        "Клиника прислала документ после приёма. Чтобы добавить его в медкарту и посмотреть содержание, нужно будет указать дату рождения пациента. Это проверка для безопасности данных.",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(child: SizedBox()),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonAction(
                    text: "Добавить в медкарту",
                    colorButton: Color(0xFF1A5DD0),
                    colorText: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  ButtonAction(
                    text: "Удалить",
                    colorButton: Color(0xFFECF1FB),
                    colorText: Color(0xFF1A5DD0),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyPart extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon;

  const BodyPart({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (text2 == "") {
      return Row(
        children: [
          Icon(icon),
          SizedBox(width: 30),
          Text(text1, style: theme.textTheme.bodyLarge),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(icon),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1, style: theme.textTheme.bodyLarge),
              Text(text2, style: theme.textTheme.bodySmall),
            ],
          ),
        ],
      );
    }
  }
}

class ButtonAction extends StatelessWidget {
  final String text;

  final Color colorButton;
  final Color colorText;
  final VoidCallback onPressed;

  const ButtonAction({
    super.key,
    required this.text,
    required this.colorButton,
    required this.onPressed,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: colorText,
        ),
      ),
    );
  }
}
