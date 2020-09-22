class Student {
  final String firstName;
  final String lastName;
  final String gender;
  final String district;
  final String profile;
  final DateTime dob;
  final List<Map<String, double>> monthlyRaised;
  final List<Map<String, double>> monthlyTargets;
  final List<Map<String, double>> termGrades;
  final Map<String, double> strengths;

  Student(this.firstName, this.lastName, this.gender, this.district, this.profile, this.dob, this.monthlyRaised, this.monthlyTargets, this.termGrades, this.strengths);
}