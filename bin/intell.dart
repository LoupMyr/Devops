import 'dart:io';

class Intell {
  static Future<String> createConf(String nom) async {
    String cmd = 'nano /etc/apache2/sites-availables/$nom.conf';
    await Process.run('bash', ['-c', cmd]);

    String ligne =
        'echo "<VirtualHost *:80>" > /etc/apache2/sites-availables/$nom.conf';
    await Process.run('bash', ['-c', ligne]);

    ligne =
        'echo "	ServerAdmin webmaster@localhost" >> /etc/apache2/sites-availables/$nom.conf';
    await Process.run('bash', ['-c', ligne]);

    ligne =
        'echo "DocumentRoot /var/www/html" >> /etc/apache2/sites-availables/$nom.conf';
    await Process.run('bash', ['-c', ligne]);

    ligne =
        'echo "ErrorLog \${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-availables/$nom.conf';
    await Process.run('bash', ['-c', ligne]);

    ligne =
        'echo "CustomLog \${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-availables/$nom.conf';
    await Process.run('bash', ['-c', ligne]);

    ligne = 'echo "</VirtualHost>" >> /etc/apache2/sites-availables/$nom.conf';
    await Process.run('bash', ['-c', ligne]);

    String result = "Success !";
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

  static Future<void> createMapUser(String nom) async {}

  static Future<void> createUser(String nom) async {}

  static Future<void> startF2B() async {}

  static Future<void> editF2B(String bantime, String findtime) async {}

  static Future<void> banIP(String ip) async {}

  static Future<void> unbanIP(String ip) async {}
}
