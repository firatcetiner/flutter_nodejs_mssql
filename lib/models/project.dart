class Project {
  int projectid;
  int companyid;
  String name;
  String deadline;

  Project.fromJson(Map<String, dynamic> json) {
    projectid = json['ProjectID'];
    companyid = json['P_CompanyID'];
    name = json['ProjectName'];
    deadline = json['ProjectDeadline'];
  }

  Project.toJson() {
    final data = Map<String, dynamic>();
    data['ProjectID'] = this.projectid;
    data['P_CompanyID'] = this.companyid;
    data['ProjectName'] = this.name;
    data['ProjectDeadline'] = this.deadline;
  }
}