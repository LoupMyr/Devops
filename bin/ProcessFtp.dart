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
  static Future<void> createMapUser(String nom) async {
    String cmd = "adduser $nom";
    Process p = await Process.start('bash', ['-c', cmd]);
    stdout.addStream(p.stdout);
    stderr.addStream(p.stderr);
    p.stdin.addStream(stdin);
  }

  //Créé un utilisateur virtuel
  static Future<void> createUser(String nom) async {
    String cmd =
        "pure-pw useradd $nom -u 9999 -g 9999 -d /home/FTPUSER/$nom -m";
  }
}
