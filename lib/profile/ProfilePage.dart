import 'package:fitted/firebase_authentication/firebase_auth_services.dart';
import 'package:fitted/reusable/toast.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? employeeData;

  @override
  void initState() {
    super.initState();
    fetchEmployeeData();
  }

  Future<void> fetchEmployeeData() async {
    Map<String, dynamic>? data = await DatabaseMethods().getEmployee("0");
    setState(() {
      employeeData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2126),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2126),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                child: Image.asset(
                  "assets/users/self.jpeg",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                employeeData?['Name'] ?? 'Loading...',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                employeeData?['Phone'] ?? 'Loading...',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                employeeData?['Profession'] ?? 'Loading...',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                employeeData?['Country'] ?? 'Loading...',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () async {
                  Map<String, dynamic> employeeInfoMap = {
                    "Name": "Affan",
                    "Phone": "+92-3164284774",
                    "Age": 22,
                    "Profession": "Software Engineer",
                    "Country": "Pakistan"
                  };
                  await DatabaseMethods().addEmployee(employeeInfoMap, "0");
                  showToast(message: "Data Uploaded Successfully!");
                  fetchEmployeeData(); // Re-fetch the data to update the UI
                },
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
