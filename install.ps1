$repo = "https://raw.githubusercontent.com/Sutshi1201/Bash-Number-game/refs/heads/main/game.ps1"
Invoke-WebRequest "$repo/game.ps1" -OutFile "game.ps1"
Invoke-WebRequest "$repo/highscores.txt" -OutFile "highscores.txt"
Write-host ""
Write-Host "Number Game installed successfully!" -ForegroundColor Green
Write-Host "Run the game using .\game.ps1"