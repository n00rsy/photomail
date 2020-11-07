import 'package:mailto/mailto.dart';
import 'dart:developer';
// For Flutter applications, you'll most likely want to use
// the url_launcher package.
import 'package:url_launcher/url_launcher.dart';

void launchMailto(String toEmail, String bodyMsg) async {
  log('entering mail launch');
  final mailtoLink = Mailto(
    to: [toEmail],
    subject: 'HackRU F20 PhotoMail',
    body: bodyMsg,
  );
  await launch('$mailtoLink');
}