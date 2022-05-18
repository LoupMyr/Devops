import 'dart:io';

class ProcessFtp {
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

  //Crée le lien symbolique "60puredb"
  static Future<ProcessResult> createLnS() async {
    String cmd =
        "sudo ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/60puredb";
    ProcessResult result = await Process.run('bash', ['-c', cmd]);
    return result;
  }

  //Créé l'utilisateur sur lequel sera mapper tous les autres utilisateurs virtuels
  static Future<Process> createMapUser(String nom) async {
    String cmd = "adduser $nom";
    Process p = await Process.start('bash', ['-c', cmd]);
    while (p.exitCode != 0) {
      print(p.stdout);
      p.stdin.writeln();
    }
    return p;
  }

  //Créé un utilisateur virtuel
  static Future<Process> createUser(String nom) async {
    String cmd =
        "pure-pw useradd $nom -u 9999 -g 9999 -d /home/FTPUSER/$nom -m";
    Process p = await Process.start('bash', ['-c', cmd]);
    stdout.addStream(p.stdout);
    stderr.addStream(p.stderr);
    await p.stdin.addStream(stdin);
    return p;
  }
}
