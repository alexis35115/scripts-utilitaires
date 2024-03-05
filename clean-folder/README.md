# Script PowerShell permettant de faire le ménage des dossiers temporaires

## Préparation

1. Télécharchez le fichier `cleanFolder.ps1`.
2. Copiez le fichier `cleanFolder.ps1` à la racine du répertoire cible.

## Exécution

Vous pouvez exécuter ce script en fournissant le chemin du répertoire à supprimer en tant que paramètre, par exemple :

Exécutez la commande ici-bas :

```ps1
.\cleanFolder.ps1 -chemin "C:\Chemin\Vers\Le\Repertoire"
```

Si aucun chemin n'est fourni, le script utilisera le répertoire courant par défaut. Vous pouvez également exécuter le script sans spécifier de chemin pour utiliser le répertoire courant par défaut :

```ps1
.\cleanFolder.ps1
```

Vous devriez voir un log de toutes actions effectuées.

Tous droits réservés 2024 © Alexis Garon-Michaud
