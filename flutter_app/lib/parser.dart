parseString(String s) {

  s = s.replaceAll("\n", "").replaceAll("\r", "").replaceAll("\t", "");
  String to = s.substring(s.indexOf("To:"), s.indexOf("Body:"));
  String body = s.substring(s.indexOf("body"));

  int toIndex = s.indexOf("To: ");
  int bodyIndex = s.indexOf("Body: ");
  if (toIndex >= 0 && bodyIndex >= 0) {
    String to = s.substring(toIndex+4, bodyIndex);
    String body = s.substring(bodyIndex+6);

    print("To: '" + to +"'\n\n\n\nBody: '" + body + "'");
    return [to, body];
  }
  else {
    print("couldn't parse string");
    return null;
  }
}
