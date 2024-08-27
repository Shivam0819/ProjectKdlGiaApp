import 'package:url_launcher/url_launcher.dart';

_launchURL(String stockId, String lab) async {
    Uri url;
    if (lab == "GIA") {
      url = Uri.parse('https://www.gia.edu/report-check?reportno=$stockId');
    }else if(lab == "HRD"){
      url = Uri.parse('https://www.gia.edu/report-check?reportno=$stockId');
    }
    else {
      url = Uri.parse('https://www.igi.org/verify-your-report/?r=$stockId');
    }

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }