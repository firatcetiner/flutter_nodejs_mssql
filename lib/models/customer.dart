class Customer {
  int customerid;
  String customername;
}

class Individual {
  int ssn;
  String firstname;
  String lastname;
  String mail;
  String phone;

  Individual({
    this.ssn,
    this.firstname,
    this.lastname,
    this.mail,
    this.phone
  });

  Individual.fromJson(Map<String, dynamic> json) {
    ssn = json['IndividualSSN'];
    firstname = json['FirstName'];
    lastname = json['LastName'];
    mail = json['IndividualMail'];
    phone = json['IndividualPhoneNumber'];
  }

  Individual.toJson() {
    final data = Map<String, dynamic>();
    data['IndividualSSN'] = this.ssn;
    data['FirstName'] = this.firstname;
    data['LastName'] = this.lastname;
    data['IndividualMail'] = this.mail;
    data['IndividualPhoneNumber'] = this.phone;
  }
}

class Company {
  String companyid;
  String name;
  String sector;
  int employees;
  int projects;

  Company.fromJson(Map<String, dynamic> json) {
    companyid = json['TaxNo'];
    name = json['CompanyName'];
    sector = json['Sector'];
    employees = json['NumberOfEmployees'];
    projects = json['NumberOfProjects'];
  }

  Company.toJson() {
    final data = Map<String, dynamic>();
    data['TaxNo'] = this.companyid;
    data['CompanyName'] = this.name;
    data['Sector'] = this.sector;
    data['NumberOfEmployees'] = this.employees;
    data['NumberOfProjects'] = this.projects;
  }
}