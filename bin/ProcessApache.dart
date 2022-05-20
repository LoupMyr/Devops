import 'dart:io';

class ProcessApache {
  static Future<ProcessResult> createConf(String nom) async {
    String ligne = "echo -e '<VirtualHost *:80>" +
        "\n" +
        "ServerAdmin webmaster@localhost" +
        "\n" +
        "DocumentRoot /var/www/html" +
        "\n" +
        "ErrorLog \${APACHE_LOG_DIR}/error.log" +
        "\n" +
        "CustomLog \${APACHE_LOG_DIR}/access.log combined" +
        "\n" +
        "</VirtualHost>' > /etc/apache2/sites-availables/$nom.conf";
    ProcessResult result = await Process.run('bash', ['-c', ligne]);
    return result;
  }

  static Future<ProcessResult> editConf(String nom, String route,
      String directoryIndex, String options, String require) async {
    String ligne = "echo -e '<VirtualHost *:80>" +
        "\n" +
        "ServerAdmin webmaster@localhost" +
        "\n" +
        "DocumentRoot /var/www/html" +
        "\n" +
        "ErrorLog \${APACHE_LOG_DIR}/error.log" +
        "\n" +
        "CustomLog \${APACHE_LOG_DIR}/access.log combined" +
        "\n" +
        "<Directory '$route'>" +
        "\n" +
        "DirectoryIndex $directoryIndex" +
        "\n" +
        "Options $options" +
        "\n" +
        "Require $require" +
        "\n" +
        "</Directory>" +
        "\n" +
        "</VirtualHost>' > /etc/apache2/sites-availables/$nom.conf";
    ProcessResult result = await Process.run('bash', ['-c', ligne]);
    return result;
  }

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
}
