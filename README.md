# Logiciel DevOps
## Sommaire
- [Présentation](#présentation)
- [Détails du projet](#détails-du-projet)
- [Exemple d'utilisation](#exemple-dutilisation)


## Présentation

Ce projet DevOps consiste à réaliser un logiciel dans le langage Dart reposant sur la programmation orientée objet permettant à l'utilisateur de gérer des confs Apache2, de créer des utilisateurs virtuels Pure-FTPD, mettre en place la sécurité contre les attaques de force brute grâce à Fail2Ban et de bannir ou débannir des IPs précises avec Iptables et Ipset. 


## Détails du projet

### Fonctionnement

Ce logiciel se lance dans un terminal. Son affichage repose sur des écrans différents, ils permettent de rediger l'utilisateur vers le choix qu'il aura lui même saisi. Les choix réalisés se traduisent par des entiers : c'est à dire qu'un entier permet de déterminer la suite du logiciel selon la volonté de l'utilisateur.


### Les affichages / saisies (IHM)

Les différents écrans se trouvent dans les classes "IhmPrincipale", "IhmInstall", "IhmApache", "IhmFtp" et "IhmFail2Ban". L'IHM principale gére l'écran d'accueil qui redigera l'utilisateur selon le choix qu'il aura saisi au travers le terminal. La redirection se fera alors dans soit l'une des autres classes cité précedemment ou, si l'uilisateur l'a souhaité, quittera le logiciel. Les IHM autres que la principale afficheront les menus qui lanceront les 
les méthodes qui appeleront l'intelligence du logiciel qui exécutera l'opération souhaité. 


### L'intelligence (Process)

Concernant l'intelligence du logiciel, elle repose sur les classes "Process" comme "ProcessInstall", "ProcessApache", "ProcessFtp" et "ProcessF2B". Chaque classes "Process" est lié à une classe "IHM" comme "IhmApache" et "ProcessApache" par exemple. Ces classes "Process" permettent d'éxécuter, au travers de méthodes, les commandes terminales. C'est donc dans ces classses que le logiciel va intéragir avec les services lui-même. 

### Les différentes requêtes disponibles

Le logiciel possède une multitude de commandes possible, vous retrouvez pour le service Apache2:
* Créer une configuration et la nommer
* Modifier le Directory d'une configuration précise en fonction de son nom
* Activer une configuration en saisissant son nom
* Désactiver une configuration en saisissant son nom
* Redémarrer Apache2

Par la suite, le logicel propose pour Pure-FTPD:
* Vérifier si le lien symbolique "60puredb" pointant vers "PureDB" existe
* Créer le lien symbolique "60puredb" si celui-ci n'existe pas
* Créer un utilisateur pour le mappage avec le nom que l'on souhaite
* Créer un utilisateur basé sur le l'utilisateur fait pour le mappage créé

Au niveau de la sécurité, vous pourrez:
 * Mettre en place Fail2Ban ce qui créé une "jail" et mettra les paramètres basiques et activera ces paramètres pour Pure-FTPD. Une liste pour ipset sera également créé.
 * Modifier la jail de Fail2Ban
 * Afficher la jail de Fail2Ban
 * Bannir une ip avec ipset
 * Débannir une ip avec ipset

## Exemple d'utilisation

Tout d'abord, lorsque l'on lance le logiciel, on obtient cet affichage: 

![menuPrincipale](https://user-images.githubusercontent.com/100768194/169303399-8fc1934d-d2df-4855-84ac-441d4114e9b1.png)

Pour cet exemple, nous irons activer Fail2Ban. Nous nous rendons alors dans le menu de sécurité en tapant `3`.

Nous voyons alors à l'écran à présent un menu concernant la sécurité de notre service Pure-FTPD:

![menuF2B](https://user-images.githubusercontent.com/100768194/169304208-0e8b5d2d-0517-4d99-9ec5-36e171ddc2dc.png)

Nous avons divers choix qui nous sont proposé, nous allons tout d'abord "mettre en place Fail2Ban". Pour cela, nous tappons `1`.

![mettrreF2B](https://user-images.githubusercontent.com/100768194/169305065-1b321ad1-ff63-416a-bbc8-c0278b8f1499.png)

Nous allons maintenant vérifier si la jail a été correctement créé. On rentre donc `2` pour voir la configuration de notre jail.

On remarque que la création c'est passé sans problème:

![printconf](https://user-images.githubusercontent.com/100768194/169305610-876b9283-cf19-4d06-b461-24ea0ca66a9a.png)

Cependant, nous souhaitons modifier les paramètres de cette conf, on tape alors `3`.
Nous rentrons égalemment les paramètres nécessaires que nous souhaitons. Ici on mettra `120` pour le bantime, `60`pour le findtime et enfin `5` en maxretry.

![edit](https://user-images.githubusercontent.com/100768194/169306231-91bfa548-bd12-4561-81f3-6b5293295ad5.png)

A présent, nous vérifions à nouveau les modifications apporté en tappant `2`.

![confedit](https://user-images.githubusercontent.com/100768194/169307062-2c3cdfac-ad2d-469b-914a-bf3409ac5c59.png)

Tout est en ordre, maintenant nous pouvons quitter en tappant `0`.

![quitter](https://user-images.githubusercontent.com/100768194/169307292-b87b108d-bf62-4b0c-b8c0-81516e5a5983.png)

De retour au menu principal, nous allons quitter le logiciel en tappant encore une fois `0`.
