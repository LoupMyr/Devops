import 'dart:io';

class ProcessF2B {
  static Future<void> startF2B() async {
    String cmd =
        'sudo touch /etc/fail2ban/jail.d/blacklist.conf | echo -e "[DEFAULT]\nbantime= 3600\nfindtime= 1800\nmaxretry= 3\n\n[pure-ftpd]\nenabled= true" > /etc/fail2ban/jail.d/blacklist.conf ';
    await Process.run('bash', ['-c', cmd]);
    String commande = "ipset create blacklist hash:net";
    await Process.run('bash', ['-c', commande]);
  }

  static Future<ProcessResult> getConf() async {
    String cmd = "cat /etc/fail2ban/jail.d/blacklist.conf";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }

  static Future<void> editF2B(
      String bantime, String findtime, int maxretry) async {
    String cmd = "echo -e '[DEFAULT]" +
        "\n" +
        "bantime = $bantime" +
        "\n" +
        "findtime = $findtime" +
        "\n" +
        "maxretry = $maxretry" +
        "\n\n" +
        "[pure-ftpd]" +
        "\n" +
        "enabled = true' > /etc/fail2ban/jail.d/blacklist.conf";
    await Process.run('bash', ['-c', cmd]);
  }

  static Future<void> banIP(String ip) async {
    String cmd = "ipset add blacklist $ip";
    await Process.run('bash', ['-c', cmd]);
  }

  static Future<void> unbanIP(String ip) async {
    String cmd = "ipset del blacklist $ip";
    await Process.run('bash', ['-c', cmd]);
  }
}
