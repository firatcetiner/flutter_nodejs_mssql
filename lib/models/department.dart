class Department {
  int departmentid;
  int companyid;
  String name;
  int employees;
  String phone;
  String mail;

  Department.fromJson(Map<String, dynamic> json) {
    departmentid = json['DepartmentID'];
    companyid = json['D_CompanyID'];
    name = json['DeparmentName'];
    employees = json['WorkingEmployees'];
    mail = json['DepartmentMail'];
    phone = json['DepartmentPhoneNumber'];
  }

  Department.toJson() {
    final data = Map<String, dynamic>();
    data['DepartmentID'] = this.departmentid;
    data['D_CompanyID'] = this.companyid;
    data['DeparmentName'] = this.name;
    data['WorkingEmployees'] = this.employees;
    data['DepartmentMail'] = this.mail;
    data['DepartmentPhoneNumber'] = this.phone;
  }
}