class Employee {
  String ssn;
  String companyid;
  String departmentid;
  String projectid;
  String firstname;
  String lastname;
  bool issupervisor;
  String mail;
  String password;
  bool isworking;

  Employee({
    this.ssn,
    this.companyid,
    this.departmentid,
    this.projectid,
    this.firstname,
    this.lastname,
    this.issupervisor,
    this.mail,
    this.password,
    this.isworking
  });

  Employee.fromJson(Map<String, dynamic> json) {
    ssn = json['EmployeeSSN'];
    companyid = json['Employee_CompanyID'];
    departmentid = json['Employee_DepartmentID'];
    projectid = json['Employee_ProjectID'];
    firstname = json['FirstName'];
    lastname = json['LastName'];
    issupervisor = json['IsSupervisor'];
    mail = json['EmployeeMail'];
    password = json['EmployeePassword'];
    isworking = json['IsWorking'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['EmployeeSSN'] = this.ssn;
    data['Employee_CompanyID'] = this.companyid;
    data['Employee_DepartmentID'] = this.departmentid;
    data['Employee_ProjectID'] = this.projectid;
    data['FirstName'] = this.firstname;
    data['LastName'] = this.lastname;
    data['IsSupervisor'] = this.issupervisor;
    data['EmployeeMail'] = this.mail;
    data['EmployeePassword'] = this.password;
    data['IsWorking'] = this.isworking;
    return data;
  }
}
