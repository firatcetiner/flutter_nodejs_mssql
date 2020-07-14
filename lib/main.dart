import 'dart:convert';

import 'package:cse3055_project/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/customer.dart';
import 'models/employee.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedPage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DatabaseDemo'), centerTitle: true,),
      body: IndexedStack(
        index: _selectedPage,
        children: <Widget>[
          EmployeePage(),
          CompanyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            _selectedPage = i; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            title: Container()
          )
        ],
      ),
    );
  }
}


class EmployeePage extends StatefulWidget {

  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {

  var employees = List<Employee>();
  void getEmployeeByCompanyID(int companyid) async {
    final response = await http.get(
      Uri.http('192.168.43.13:3000', '/employee/get_all'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      }
    );
    if(response.statusCode == 200) {
      print(jsonDecode(response.body).map<Employee>((json) => Employee.fromJson(json)));
      setState(() {
        employees = jsonDecode(response.body).map<Employee>((json) => Employee.fromJson(json)).toList();
      });
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.search),
        label: Text('Get Employees'),
        onPressed: () async {
          getEmployeeByCompanyID(2);
        },
      ),
    body: ListView.builder(
            itemCount: employees.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text((index + 1).toString(), style: TextStyle(fontSize: 35),),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.solidUser, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('Name: '),
                                      ),
                                    ],
                                  ),
                                  Text(employees[index].firstname + " " + employees[index].lastname),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.key, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('SSN: '),
                                      ),
                                    ],
                                  ),
                                  Text(employees[index].ssn),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.solidEnvelope, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('email: '),
                                      ),
                                    ],
                                  ),
                                  Text(employees[index].mail),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.solidBuilding, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('CompanyID: '),
                                      ),
                                    ],
                                  ),
                                  Text(employees[index].companyid.toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.solidBuilding, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('ProjectID: '),
                                      ),
                                    ],
                                  ),
                                  Text(employees[index].projectid.toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.building, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('DepartmentID: '),
                                      ),
                                    ],
                                  ),
                                  Text(employees[index].departmentid.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
    );
  }
}


class CompanyPage extends StatefulWidget {

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {

  var companies = List<Company>();

  void getCompanies() async {
    final response = await http.get(
      Uri.http('192.168.43.13:3000', '/company/get_all'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      }
    );
    if(response.statusCode == 200) {
      print(jsonDecode(response.body).map<Company>((json) => Company.fromJson(json)));
      setState(() {
        companies = jsonDecode(response.body).map<Company>((json) => Company.fromJson(json)).toList();
      });
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.search),
        label: Text('Get Companies'),
        onPressed: () async {
          getCompanies();
        },
      ),
    body: ListView.builder(
            itemCount: companies.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text((index + 1).toString(), style: TextStyle(fontSize: 35),),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.solidUser, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('Sector: '),
                                      ),
                                    ],
                                  ),
                                  Text(companies[index].sector),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.key, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('SSN: '),
                                      ),
                                    ],
                                  ),
                                  Text(companies[index].companyid),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.solidEnvelope, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('NumberOfEmployees: '),
                                      ),
                                    ],
                                  ),
                                  Text(companies[index].employees.toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.solidAddressCard, size: 15,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text('NumberOfProjects: '),
                                      ),
                                    ],
                                  ),
                                  Text(companies[index].companyid.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
    );
  }

}
