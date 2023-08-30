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

$meals = @(
    "Pasta with Tomato Sauce", 
    "Chicken and Salad", 
    "Curry", 
    "Stir Fry", 
    "Steak", 
    "Chicken Steak, Mash and Veg", 
    "Chicken fried rice"
)

# $snacks = @(
#     "Carrot Sticks with paprika tomato paste", 
#     "Sandwich", 
#     "Fruit", 
#     "Egg fried rice"
# )

Send email with randomised exercises on it

function Send-email {
    param (
        [string]$first
    )
    $username = (Get-Content ".\creds.txt")[0]
    $password = (Get-Content ".\creds.txt")[1] | ConvertTo-SecureString -AsPlainText -Force

    $category = "strength", "bodyweight" | Sort-Object {Get-Random}
    $type = if($category[0] -like "strength"){
        $strength | Sort-Object{Get-Random}
    } else {
        $bodyweight | Sort-Object {Get-Random}
    }

    $exercises = foreach($exercise in $type){
        "<li>$exercise</li>"
    }

    $body = @"
    <h1>Todays Workout</h1>
    <ul>
        $exercises
    </ul>
    <h1>Today's Meal Plan</h1>
    <h3>Lunch: $lunch
"@
    $email = @{
        from = $username
        to = $username
        subject = "Workout"
        smtpserver = "smtp.gmail.com"
        body = $body
        port = 587
        credential = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $password
        usessl = $true
        verbose = $true
    }
    
    Send-MailMessage @email -BodyAsHtml
}

Send-Email