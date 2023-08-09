# Add exercises to array
$strength = @(
    "Pullups", 
    "Bicep Curls"
    "Deadlift", 
    "bench Press (Bar or Dumbbell)", 
    "Renegade Rows", 
    "Leg Press", 
    "Chest Fly"
    "Lat Pulldown", , 
    "Situps",
    "Dumbbell Ab Crunches", 
    "Leg Raises",
    "Skull Crushers",
    "Tricep Rows"
    "Pushups"
)

$bodyweight = @(
    "1km run",
    "Box Jumps",
    "1km Rowing",
    "1km bike",
    "Sledge", 
    "Pullups",
    "Pushups", 
    "Goblet Squats", 
    "Situps",
    "Dumbbell Ab Crunches",
    "Leg Raises"    
)

# randomise 4-5 exercises + supersets
$exercise = "strength", "bodyweight" | Sort-Object {Get-Random}
$test = if($exercise[0] -like "strength"){
    $strength | Sort-Object{Get-Random}
} else {
    $bodyweight | Sort-Object {Get-Random}
}

# Send email with randomised exercises on it

function Send-email {
    $username = (Get-Content ".\creds.txt")[0]
    $password = (Get-Content ".\creds.txt")[1] | ConvertTo-SecureString -AsPlainText -Force

    $body = @"
    <h1>Todays Workout</h1>
    <ul>
        <li>$test</li>
    </ul>
"@
    $email = @{
        from = $username
        to = $username
        subject = "Workout"
        body = $body
        smtpserver = "smtp.gmail.com"
        port = 587
        credential = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $password
        usessl = $true
        verbose = $true
    }
    
    Send-MailMessage @email
}

Send-Email
