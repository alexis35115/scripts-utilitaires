param (
    [string]$chemin = $PWD
)

$repertoiresASupprimerParDefaut = @("TestResults", "StrykerOutput", "node_modules", "bin", "obj")

# Construire la liste des répertoires par défaut dans le message avec apostrophes
$repertoiresASupprimerParDefautAffichables = "'" + ($repertoiresASupprimerParDefaut -join "', '") + "'"

# Demander à l'utilisateur s'il veut faire le ménage avec les répertoires par défaut
$confirmationDefaut = Read-Host "Voulez-vous faire le ménage avec les répertoires par défaut ($repertoiresASupprimerParDefautAffichables) ? ([O]ui/[N]on)"
$confirmationDefaut = $confirmationDefaut.ToLower()

if ($confirmationDefaut -eq 'oui' -or $confirmationDefaut -eq 'o') {
    # Définir les répertoires par défaut à supprimer
    $repertoiresASupprimer = $repertoiresASupprimerParDefaut
}
else {
    # Demander à l'utilisateur de choisir les répertoires à inclure dans le ménage
    Write-Host "Répertoires par défaut à supprimer :"
    
    $repertoiresASupprimer = @()

    foreach ($repertoire in $repertoiresASupprimerParDefaut) {
        $inclusion = Read-Host "Voulez-vous inclure le répertoire '$repertoire' dans le ménage ? ([O]ui/[N]on"
        $inclusion = $inclusion.ToLower()
        if ($inclusion -eq 'oui' -or $inclusion -eq 'o') {
            $repertoiresASupprimer += $repertoire
        }
    }

    # Vérifier si des répertoires ont été choisis
    if ($repertoiresASupprimer.Count -eq 0) {
        Write-Host "Aucun répertoire choisi. Fin du script."
        exit
    }
    else {

        # Construire la liste des répertoires à supprimer afficheables
        $repertoiresASupprimerAffichables = "'" + ($repertoiresASupprimer -join "', '") + "'"

        Write-Host "Répertoires choisis pour le ménage : $repertoiresASupprimerAffichables."
    }
}

# Fonction récursive pour supprimer les répertoires
function SupprimerRepertoires($chemin) {
    foreach ($repertoire in $repertoiresASupprimer) {
        $cheminRepertoire = Join-Path -Path $chemin -ChildPath $repertoire

        # Vérifier si le répertoire existe avant de le supprimer
        if (Test-Path $cheminRepertoire -PathType Container) {
            Remove-Item -Path $cheminRepertoire -Recurse -Force
            Write-Host "Le répertoire '$repertoire' et son contenu ont été supprimés depuis '$chemin'."
        }
    }

    # Parcourir les sous-répertoires récursivement
    $sousRepertoires = Get-ChildItem -Path $chemin -Directory
    foreach ($sousRepertoire in $sousRepertoires) {
        SupprimerRepertoires $sousRepertoire.FullName
    }
}

# Appeler la fonction pour le répertoire spécifié ou le répertoire courant
SupprimerRepertoires $chemin

Write-Host "Ménage terminé!"