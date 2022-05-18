import 'dart:io';

class ProcessF2B {
  static Future<void> startF2B() async {
    String cmd = "touch /etc/fail2ban/jail.d/blacklist.conf";
    await Process.run('bash', ['-c', cmd]);
    cmd =
        "echo -e [DEFAULT]\nbantime = 3600\nfindtime = 1800\nmaxretry = 3\nignoreip = 127.0.0.1\n[pure-ftpd]\nenabled = true > /etc/fail2ban/jail.d/blacklist.conf";
    await Process.run('bash', ['-c', cmd]);
    cmd = "ipset create blacklist hash:net";
    await Process.run('bash', ['-c', cmd]);
  }

  static Future<ProcessResult> getConf() async {
    String cmd = "cat /etc/fail2ban/jail.d/blacklist.conf";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }

  static Future<void> editF2B(
      String bantime, String findtime, int maxretry) async {
    String cmd =
        "echo -e [DEFAULT]\nbantime = $bantime\nfindtime = $findtime\n$maxretry = 3\n[pure-ftpd]\nenabled = true";
    await Process.run('bash', ['-c', cmd]);
  }

  static Future<ProcessResult> banIP(String ip) async {
    String cmd = "ipset add blacklist $ip";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }

  static Future<ProcessResult> unbanIP(String ip) async {
    String cmd = "ipset del blacklist $ip";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }
}
