# Référentiel contenant divers scripts utilitaires

## Créer un fichier d'une grosseur précise

``` ps1
$file = New-Object -TypeName System.IO.FileStream -ArgumentList D:\TestFile.txt,Create,ReadWrite

$file.SetLength(1Mb)

$file.Close()
```

## Transférer des fichiers plus rapidement qu'avec le file explorer

``` ps1
D:\backup

robocopy <source> <destination> [<file>[ ...]] [<options>]

robocopy "C:\Users\alexis" D:\backup /E

robocopy "C:\Users\alexis" D:\backup /E /r:0 /w:0
```

## Supprimer le contenu d'un répertoire (même si le chemin est trop long)

``` ps1
robocopy "C:\NomRepertoireVide" "C:\NomRepertoireASupprimer" /purge
```
