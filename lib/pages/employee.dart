import 'package:flutter/material.dart';
import 'package:flutter_application_2/service/database.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});


  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  
  // Create an instance of DataBaseMethods
  final DataBaseMethods databaseMethods = DataBaseMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Employee",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Form",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Field
            Text(
              "Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20.0),

            // Age Field
            Text(
              "Age",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: agecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20.0),

            // Location Field
            Text(
              "Location",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: locationcontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 30.0),

            // Add Button
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (namecontroller.text.isEmpty ||
                      agecontroller.text.isEmpty ||
                      locationcontroller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill in all fields")),
                    );
                    return;
                  }

                  try {
                    // Add your logic
                    String Id = randomAlphaNumeric(10);
                    Map<String, dynamic> employeeInfoMap = {
                      "Name": namecontroller.text,
                      "Age": agecontroller.text,
                      "Id": Id,
                      "Location": locationcontroller.text,
                    };

                    // Call the instance method
                    await databaseMethods.addEmployeeDetails(employeeInfoMap, Id);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Employee added successfully")),
                    );

                    // Clear fields after submission
                    namecontroller.clear();
                    agecontroller.clear();
                    locationcontroller.clear();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: $e")),
                    );
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
