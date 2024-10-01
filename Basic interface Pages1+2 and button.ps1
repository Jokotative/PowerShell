# Importer l'assembly Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Créer la fenêtre principale
$form = New-Object System.Windows.Forms.Form
$form.Text = "Interface graphique principale"
$form.Size = New-Object System.Drawing.Size(300, 250)
$form.StartPosition = "CenterScreen"

# Créer un bouton et le centrer dans la fenêtre principale
$button = New-Object System.Windows.Forms.Button
$button.Text = "Ouvrir une nouvelle fenêtre"
$button.Size = New-Object System.Drawing.Size(150, 50)
$button.Location = New-Object System.Drawing.Point(
    ($form.ClientSize.Width - $button.Width) / 2,
    ($form.ClientSize.Height - $button.Height) / 2
)

# Définir l'événement à déclencher lors du clic sur le bouton
$button.Add_Click({
    # Créer une nouvelle fenêtre
    $newForm = New-Object System.Windows.Forms.Form
    $newForm.Text = "Nouvelle fenêtre"
    $newForm.Size = New-Object System.Drawing.Size(300, 250)
    $newForm.StartPosition = "CenterScreen"
    
    # Ajouter un label pour la nouvelle fenêtre
    $label = New-Object System.Windows.Forms.Label
    $label.Text = "Ceci est une nouvelle fenêtre!"
    $label.AutoSize = $true
    $label.Location = New-Object System.Drawing.Point(20, 20)

    # Ajouter le label à la nouvelle fenêtre
    $newForm.Controls.Add($label)

    # Afficher la nouvelle fenêtre
    $newForm.Add_Shown({$newForm.Activate()})
    [void]$newForm.ShowDialog()

})

# Ajouter le bouton à la fenêtre principale
$form.Controls.Add($button)

# Afficher la fenêtre principale
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
