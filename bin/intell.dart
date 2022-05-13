import 'dart:io';

class Intell {
  static Future<ProcessResult> createConf(String nom) async {
    String ligne =
        'echo -e "<VirtualHost *:80> \n    ServerAdmin webmaster@localhost \n    DocumentRoot /var/www/html \n    ErrorLog \${APACHE_LOG_DIR}/error.log \n    CustomLog \${APACHE_LOG_DIR}/access.log combined \n</VirtualHost>" > /etc/apache2/sites-available/$nom.conf';
    ProcessResult result = await Process.run('bash', ['-c', ligne]);
    return result;
  }

  static Future<void> editConf(String nom) async {}

  static Future<ProcessResult> turnOnConf(String nom) async {
    String cmd = "a2ensite $nom.conf";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }

  static Future<ProcessResult> turnOffConf(String nom) async {
    String cmd = "a2dissite $nom.conf";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }

  static Future<ProcessResult> redemApache() async {
    String cmd = "service apache2 restart";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }

  static Future<bool> verifyLnS() async {
    bool valide = false;
    String cmd = "ls /etc/pure-ftpd/auth/ | grep 60puredb";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    print(result.stderr);
    if (result.stdout != "") {
      valide = true;
    }
    return valide;
  }

  static Future<ProcessResult> createLnS() async {
    String cmd =
        "sudo ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/60puredb";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }

  static Future<void> createMapUser(String nom) async {}

  static Future<void> createUser(String nom) async {}

  static Future<void> startF2B() async {}

  static Future<void> editF2B(String bantime, String findtime) async {}

  static Future<void> banIP(String ip) async {}

  static Future<void> unbanIP(String ip) async {}

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
