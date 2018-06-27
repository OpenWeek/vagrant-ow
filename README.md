# Installer et lancer la VM
* Télécharger et installer vagrant (au moins 1.9.1) sur [le site de vagrant](https://www.vagrantup.com/downloads.html)
* Télécharger et installer VirtualBox (5.1.22) sur [le site de VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* se rendre dans un dossier de votre choix et exécuter
`git clone https://github.com/OpenWeek/vagrant-ow2017.git`
* se rendre dans le dossier créé et exécuter le fichier `run_virtual_machine` . Ca prendra un peu de temps la première fois. Comme vous avez 5 minutes à tuer, pourquoi ne pas faire un score incroyable sur [Robot Unicorn Attack](http://www.adultswim.com/games/web/robot-unicorn-attack) ?

That's it ! Vous pouvez à présent vous rendre sur votre version d'INGInious et du syllabus depuis votre ordinateur (pas depuis la vm). 
* le syllabus est à l'adresse <http://localhost:5000>
* votre version d'INGInious est à l'adresse <http://localhost:8888>

# Vous ne voulez pas utiliser la VM ? 
Tout est accessible sur les machines de la salle Intel (une instance INGInious avec Blockly, le repo Syllabus et le repo OW 2017), depuis votre home étudiant. 
## Comment faire ?
* Connectez-vous sur une machine des salles
* Lancez la commande
   `prepare_workspace_ow`
* Lancez la webapp d'INGInious en lançant la commande
   `run_inginious`
* Lancez la webapp du syllabus en lançant la commande
   `run_syllabus`
* le syllabus est à l'adresse <http://localhost:5000>
* votre version d'INGInious est à l'adresse <http://localhost:8888>
Les fichiers/dossiers à modifier sont dans le dossier `OpenWeek` de votre home sur la machine de l'Intel.

Les username/password pour se connecter à la webapp vous seront communiqués à l'oral.
Vous pouvez changer de username/password en modifiant le fichier `configuration.yaml` dans le dossier `inginious_directory`. Il suffit de changer ce morceau du fichier, à votre guise :

```
users:
    [[username]]: [[password]]
```
