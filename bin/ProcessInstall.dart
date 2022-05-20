import 'dart:io';

class ProcessInstall {
  static Future<void> installApache() async {
    String cmd = "sudo apt install apache2 -y";
    ProcessResult p = await Process.run('bash', ['-c', cmd]);
    print(p.stdout);
    print(p.stderr);
  }

  static Future<void> installFtp() async {
    String cmd = "sudo apt install pure-ftpd -y";
    ProcessResult p = await Process.run('bash', ['-c', cmd]);
    print(p.stdout);
    print(p.stderr);
  }

  static Future<void> installF2B() async {
    String cmd = "sudo apt install fail2ban -y";
    ProcessResult p = await Process.run('bash', ['-c', cmd]);
    print(p.stdout);
    print(p.stderr);
  }

  static Future<void> installIpTables() async {
    String cmd = "sudo apt install iptables -y";
    ProcessResult p = await Process.run('bash', ['-c', cmd]);
    print(p.stdout);
    print(p.stderr);
  }

  static Future<void> installIpSet() async {
    String cmd = "sudo apt install ipset -y";
    ProcessResult p = await Process.run('bash', ['-c', cmd]);
    print(p.stdout);
    print(p.stderr);
  }
}
