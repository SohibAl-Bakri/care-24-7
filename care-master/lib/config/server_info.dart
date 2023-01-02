import 'package:care/models/models_export.dart';

class ServerInfo {
  static String serverURL = "https://careproject.000webhostapp.com/care/";

  static String loginURL = "${serverURL}auth/login.php";
  static String signUpURL = "${serverURL}auth/signup.php";

  static String getDoctorsURL = "${serverURL}doctor/getdoctors.php";
  static String getDoctorsForAdminURL =
      "${serverURL}doctor/getdoctorsforadmin.php";
  static String getPatientInfoURL = serverURL;
  static String getAppointmentURL = "${serverURL}appointment/getappoitment.php";
  static String getAppointmentForPatientURL =
      "${serverURL}appointment/getappointmentforpatient.php";
  static String getAmbulanceOrderURL = "${serverURL}ambulance/getambulance.php";
  static String getReportURL = "${serverURL}report/getreport.php";
  static String getReportForAdminURL =
      "${serverURL}report/getreportforadmin.php";
  static String getFeedbackForAdminURL =
      "${serverURL}feadback/getfeedbackforadmin.php";

  static String uploadFeedbackURL = "${serverURL}feadback/uploadfeedback.php";
  static String acceptAppointmentURL =
      "${serverURL}appointment/acceptappointment.php";
  static String finishAppointment =
      "${serverURL}appointment/finishappointment.php";
  static String sendReport = "${serverURL}report/sendreport.php";

  static String setDoctorAppointmentURL =
      "${serverURL}appointment/setappointment.php";
  static String askForAmbulanceURL =
      "${serverURL}ambulance/askforambulance.php";
  static String sendReportsURL = serverURL;
  static String approveDoctorURL = "${serverURL}doctor/approvedoctor.php";
  static String deleteDoctorURL = "${serverURL}doctor/deletedoctor.php";
  static String endAmbulanceOrderURL =
      "${serverURL}ambulance/endambulanceorder.php";

  static UserModel user = UserModel(
      userID: "",
      userName: "",
      userEmail: "",
      userKind: "",
      userPhoneNumber: "",
      doctorApproved: "",
      userBloodType: "",
      userAge: "",
      specialization: "");
}
