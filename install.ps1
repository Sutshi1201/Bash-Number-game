$base = "https://raw.githubusercontent.com/Sutshi1201/Bash-Number-game/main"

try {
    Invoke-WebRequest "$base/game.ps1" -OutFile "game.ps1" -ErrorAction Stop
    Invoke-WebRequest "$base/highscores.txt" -OutFile "highscores.txt" -ErrorAction Stop

    Write-Host " "
    Write-Host "NUMBER GAME INSTALLED SUCCESSFULLY!" -ForegroundColor Green
    Write-Host "Run using: .\game.ps1"
}
catch {
    Write-Host "Installation failed: $_" -ForegroundColor Red
}