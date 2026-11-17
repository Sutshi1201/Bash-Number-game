$repo = "https://github.com/Sutshi1201/Bash-Number-game"
try 
{
Invoke-WebRequest "$repo/game.ps1" -OutFile "game.ps1" -ErrorAction Stop
Invoke-WebRequest "$repo/highscores.txt" -OutFile "highscores.txt" -ErrorAction Stop

Write-Host "Number Game installed successfully!" -ForegroundColor Green
Write-Host "Run the game using .\game.ps1"
}
catch 
{
    Write-Host "Installation failed : $_" -ForegroundColor Red
}
