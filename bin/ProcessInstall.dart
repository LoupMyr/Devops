import 'dart:io';

class ProcessInstall {
  static Future<void> installApache() async {
    String cmd = "sudo apt install apache2";
    Process p = await Process.start('bash', ['-c', cmd]);
    stdout.addStream(p.stdout);
    stderr.addStream(p.stderr);
    p.stdin.addStream(stdin);
  }

  static Future<void> installFtp() async {
    String cmd = "sudo apt install pure-ftpd";
    Process p = await Process.start('bash', ['-c', cmd]);
    stdout.addStream(p.stdout);
    stderr.addStream(p.stderr);
    p.stdin.addStream(stdin);
  }

  static Future<void> installF2B() async {
    String cmd = "sudo apt install fail2ban";
    Process p = await Process.start('bash', ['-c', cmd]);
    stdout.addStream(p.stdout);
    stderr.addStream(p.stderr);
    p.stdin.addStream(stdin);
  }

  static Future<void> installIpTables() async {
    String cmd = "sudo apt install iptables";
    Process p = await Process.start('bash', ['-c', cmd]);
    stdout.addStream(p.stdout);
    stderr.addStream(p.stderr);
    p.stdin.addStream(stdin);
  }
}
