# Add exercises to array
$exercises = @(
    "Pullups", 
    "Bicep Curls"
    "Deadlift", 
    "bench Press (Bar or Dumbbell)", 
    "1km run",
    "1km row"
    "Renegade Rows", 
    "Box Jumps", 
    "Leg Press", 
    "Chest Fly"
    "Lat Pulldown", 
    "1km Rowing"
    "Goblet Squats", 
    "Situps", 
    "Dumbbell Ab Crunches", 
    "Leg Raises"
    "Skull Crushers"
    "Tricep Rows"
)
# randomise 4-5 exercises
$workout = $exercises | Sort-Object{Get-Random}
$workout[0..4]

# Send email with randomised exercises on it