# Add exercises to array
$strength = @(
    "Pullups", 
    "Bicep Curls"
    "Deadlift", 
    "bench Press (Bar or Dumbbell)", 
    "Renegade Rows", 
    "Leg Press", 
    "Chest Fly"
    "Lat Pulldown", 
    "Goblet Squats", 
    "Situps",
    "Dumbbell Ab Crunches", 
    "Leg Raises",
    "Skull Crushers",
    "Tricep Rows"
)

$cardio = @(
    "1km run",
    "Box Jumps",
    "1km Rowing",
    "1km bike"
)

# randomise 4-5 exercises + supersets
$exercise = "strength", "cardio" | Sort-Object {Get-Random}
if($exercise[0] -like "strength"){
    $workout = $strength | Sort-Object{Get-Random}
    $workout[0..7]
} else {
    $workout = $cardio
    $workout
}


# Send email with randomised exercises on it