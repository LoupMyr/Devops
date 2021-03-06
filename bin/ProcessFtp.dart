import 'dart:io';

import 'dart:math';

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
  static Future<Process> createMapUser(String nom, String mdp) async {
    String cmd = "adduser $nom";
    Process p = await Process.start('bash', ['-c', cmd]);
    p.stdin.writeln(mdp);
    p.stdin.writeln(mdp);
    p.stdin.writeln("");
    p.stdin.writeln("");
    p.stdin.writeln("");
    p.stdin.writeln("");
    p.stdin.writeln("");
    p.stdin.writeln("");
    return p;
  }

  static Future<bool> userExist(String nom) async {
    bool exist = true;
    String cmd = "id $nom";
    Process p = await Process.start('bash', ['-c', cmd]);
    if (p.stderr != "") {
      exist = false;
    }
    return exist;
  }

  static Future<int> getId(String nom) async {
    int uid = 0;
    String cmd = "grep $nom /etc/passwd | cut -d ':' -f3";
    Process p = await Process.start('bash', ['-c', cmd]);
    uid = int.parse(p.stdout.toString());
    return uid;
  }

  //Créé un utilisateur virtuel
  static Future<void> createUser(String nom, String mdp) async {
    if (await userExist(nom)) {
      int id = await getId(nom);
      String cmd =
          "pure-pw useradd $nom -u $id -g $id -d /home/FTPUSER/$nom -m";
      Process p = await Process.start('bash', ['-c', cmd]);
      p.stdin.writeln(mdp);
      p.stdin.writeln(mdp);
    }
  }

  static Future<void> optionDl(
      String nom, double dl, double upl, String mdp) async {
    String cmd = "pure-pw $nom -t $dl -T $upl -m";
    Process p = await Process.start('bash', ['-c', cmd]);
    p.stdin.writeln(mdp);
  }

  static Future<void> optionMaxFiles(
      String nom, int maxFiles, double maxMbytes, String mdp) async {
    String cmd = "pure-pw $nom -n $maxFiles -N $maxMbytes -m";
    Process p = await Process.start('bash', ['-c', cmd]);
    p.stdin.writeln(mdp);
  }

  static Future<void> optionDlRatio(
      String nom, double dl, double upl, String mdp) async {
    String cmd = "pure-pw $nom -q $dl -Q $upl -m";
    Process p = await Process.start('bash', ['-c', cmd]);
    p.stdin.writeln(mdp);
  }

  static Future<void> optionAllowIpClient(
      String nom, String allowIp, String denyIp, String mdp) async {
    String cmd = "pure-pw $nom -r $allowIp -R $denyIp -m";
    Process p = await Process.start('bash', ['-c', cmd]);
    p.stdin.writeln(mdp);
  }

  static Future<void> optionAllowIpLocale(
      String nom, String allowIp, String denyIp, String mdp) async {
    String cmd = "pure-pw $nom -i $allowIp -I $denyIp -m";
    Process p = await Process.start('bash', ['-c', cmd]);
    p.stdin.writeln(mdp);
  }

  static Future<void> optionHeure(
      String nom, String debut, String fin, String mdp) async {
    String cmd = "pure-pw $nom -z $debut-$fin -m";
    Process p = await Process.start('bash', ['-c', cmd]);
    p.stdin.writeln(mdp);
  }
}
