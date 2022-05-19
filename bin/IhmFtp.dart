import 'dart:io';
import 'IhmPrincipale.dart';
import 'ProcessFtp.dart';

class IhmFtp {
  static Future<void> menuFtp() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour\n1. Vérifier l'éxistance de 60puredb\n2. Créer le lien symbolique \"60puredb\" \n3. Créer un utilisateur pour le mappage\n4. Créer un utilisateur virtuel\n5. Mettre des restrictions sur un utilisateur\n\n");
      nb = IhmPrincipale.saisiChoix(5);
      if (nb == 1) {
        await IhmFtp.verifyLnS();
      } else if (nb == 2) {
        await IhmFtp.createLnS();
      } else if (nb == 3) {
        await IhmFtp.createMapUser();
      } else if (nb == 4) {
        await IhmFtp.createUser();
      } else if (nb == 5) {
        await IhmFtp.menuOptions();
      }
    }
  }

  static Future<void> menuOptions() async {
    int nb = -1;
    while (nb != 0) {
      print("\x1B[2J\x1B[0;0H");
      print(
          "0. Retour \n 1.Download & upload\n2. Nombre max de fichier & taille max\n3. Download & upload ratio\n4. Autoriser & bloquer une IP client\n5. Autoriser & bloquer une IP locale\n6. Tranche horaire de connexion");
      nb = IhmPrincipale.saisiChoix(5);
      if (nb == 1) {
        await IhmFtp.optionDl();
      } else if (nb == 2) {
        await IhmFtp.optionMaxFiles();
      } else if (nb == 3) {
        await IhmFtp.optionDlRatio();
      } else if (nb == 4) {
        await IhmFtp.optionAllowIpClient();
      } else if (nb == 5) {
        await IhmFtp.optionAllowIpLocale();
      } else if (nb == 5) {
        await IhmFtp.optionHeure();
      }
    }
  }

  static Future<void> verifyLnS() async {
    print("Lancement de la vérification...");
    sleep(const Duration(seconds: 2));
    if (await ProcessFtp.verifyLnS()) {
      print("Lien symbolique déjà existant");
      sleep(const Duration(seconds: 5));
    } else {
      print("Lien symbolique pas encore créé");
      sleep(const Duration(seconds: 2));
    }
  }

  static Future<void> createLnS() async {
    if (!await ProcessFtp.verifyLnS()) {
      print("Création en cours...");
      sleep(const Duration(seconds: 2));
      ProcessResult result = await ProcessFtp.createLnS();
      print("Création terminé !");
      print(result.stderr);
      print(result.stdout);
      sleep(const Duration(seconds: 2));
    } else {
      print("Lien déjà existant");
      sleep(const Duration(seconds: 2));
    }
  }

  static Future<void> createMapUser() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez pour le mappage");
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    Process result = await ProcessFtp.createMapUser(nom);
    print(result.stdout);
    print(result.stderr);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> createUser() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez créer");
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    Process result = await ProcessFtp.createUser(nom);
    print(result.stdout);
    print(result.stderr);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> optionDl() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez restreindre");
    double dl = double.parse(
        IhmPrincipale.saisieInt("la bande passante pour cet utilisateur")
            .toString());
    double upl = double.parse(
        IhmPrincipale.saisieInt("la bande passante pour cet utilisateur")
            .toString());
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    Process result = await ProcessFtp.optionDl(nom, dl, upl);
    print(result.stdout);
    print(result.stderr);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> optionMaxFiles() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez restreindre");
    int maxFiles = IhmPrincipale.saisieInt(
        "le nombre de fichiers maximum pour cet utilisateur");
    double maxMbytes = double.parse(
        IhmPrincipale.saisieInt("la bande passante max pour cet utilisateur")
            .toString());
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    Process result = await ProcessFtp.optionMaxFiles(nom, maxFiles, maxMbytes);
    print(result.stdout);
    print(result.stderr);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> optionDlRatio() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez restreindre");
    double dl = double.parse(
        IhmPrincipale.saisieInt("le download ratio pour cet utilisateur")
            .toString());
    double upl = double.parse(
        IhmPrincipale.saisieInt("le upload ratio pour cet utilisateur")
            .toString());
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    Process result = await ProcessFtp.optionDlRatio(nom, dl, upl);
    print(result.stdout);
    print(result.stderr);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> optionAllowIpClient() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez restreindre");
    String allowIp =
        IhmPrincipale.saisieString("l'IP que vous souhaitez autoriser");
    String denyIp =
        IhmPrincipale.saisieString("l'IP que vous souhaitez bloquer");
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    Process result = await ProcessFtp.optionAllowIpClient(nom, allowIp, denyIp);
    print(result.stdout);
    print(result.stderr);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> optionAllowIpLocale() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez restreindre");
    String allowIp =
        IhmPrincipale.saisieString("l'IP que vous souhaitez autoriser");
    String denyIp =
        IhmPrincipale.saisieString("l'IP que vous souhaitez bloquer");
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    Process result = await ProcessFtp.optionAllowIpLocale(nom, allowIp, denyIp);
    print(result.stdout);
    print(result.stderr);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
  }

  static Future<void> optionHeure() async {
    String nom = IhmPrincipale.saisieString(
        "le nom d'utilisateur que vous souhaitez restreindre");
    String debut = IhmPrincipale.saisieString("l'heure de début");
    String fin = IhmPrincipale.saisieString("l'heure de fin");
    print("Création en cours...");
    sleep(const Duration(seconds: 2));
    Process result = await ProcessFtp.optionHeure(nom, debut, fin);
    print(result.stdout);
    print(result.stderr);
    print("Création terminée");
    sleep(const Duration(seconds: 2));
  }
}
