import 'package:url_launcher/url_launcher.dart';


class GitHubButtonController {
  Future<void> openGithubRepo() async {
    final url = Uri.parse('https://github.com/ivanaf03/soundfree');

    await launchUrl(url);
  }
}
