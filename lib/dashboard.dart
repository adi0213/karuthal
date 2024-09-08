import 'package:flutter/material.dart';
import 'package:new_chilla/Error.dart';
import 'package:new_chilla/PatientEnrollment/PatientEnroll.dart';
import 'package:new_chilla/design.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff80ED99),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    color: Color(0xffC7F9DE),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Center(
                    child: Text(
                      'Welcome !',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 249, 249, 249),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xff4D9173),
                            backgroundColor: Color(0xffC7F9CC),
                            minimumSize: Size(300, 150),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Colors.grey.withOpacity(0.5),
                            elevation: 7,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Patientenroll(),
                              ),
                            );
                          },
                          child: Text(
                            'Enroll Patient',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff4D9173),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xff4D9173),
                            backgroundColor: Color(0xffC7F9CC),
                            minimumSize: Size(300, 150),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Colors.grey.withOpacity(0.5),
                            elevation: 7,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => work(),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Veiw Service',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff4D9173),
                                ),
                              ),
                              Text(
                                'History',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff4D9173),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xff4D9173),
                            backgroundColor: Color(0xffC7F9CC),
                            minimumSize: Size(300, 150),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadowColor: Colors.grey.withOpacity(0.5),
                            elevation: 7,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => work(),
                              ),
                            );
                          },
                          child: Text(
                            'Book Caretaker',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff4D9173),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu,
                        size: 35,
                        color: const Color.fromARGB(255, 247, 246, 246)),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
