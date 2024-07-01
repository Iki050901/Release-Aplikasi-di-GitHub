import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.9, end: 1.1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Profile Picture"),
                          content: Image.asset(
                              'assets/images/Pas Foto Latar Merah.jpeg'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: ScaleTransition(
                      scale: _animation,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blueAccent,
                        backgroundImage: AssetImage(
                            'assets/images/Pas Foto Latar Merah.jpeg'),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.zoom_in,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildAnimatedListTile(
                      Icons.person, "Nama: Rizki Saputra", Colors.blue),
                  _buildAnimatedListTile(
                      Icons.school, "NIM: 2106138", Colors.green),
                  _buildAnimatedListTile(Icons.class_, "Kelas: B", Colors.red),
                  _buildAnimatedListTile(Icons.book,
                      "Matkul: Pratikum Pemrograman Mobile", Colors.orange),
                  _buildAnimatedListTile(Icons.location_city,
                      "Institut Teknologi Garut", Colors.purple),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedListTile(IconData icon, String text, Color color) {
    return FadeTransition(
      opacity: _animation,
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
