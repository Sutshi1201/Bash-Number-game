Write-Host "++--++--++--++--++--++--++--++" 
Write-Host "++--++ GUESS THE NUMBER ++--++"
Write-Host "++--++--++--++--++--++--++--++"
Start-Sleep -Seconds 1
$name = Read-Host "Enter Your Name pls 0_< "
Start-Sleep -Seconds 1
Write-Host "Hey Welcome $name 0.0!"
Start-Sleep -Seconds 1
Write-Host "Are you ready to guess THE SECRET NUMBER ?"
Start-Sleep -Seconds 1
Write-Host "I hope so cuz am about to start with it 0_<"
Start-Sleep -Seconds 1
Write-Host "Ight Lets start with a demo "
Start-Sleep -Seconds 1
Write-Host "THE SECRECT NUMBER IS BETWEEN 1 AND 50"
Start-sleep -Seconds 1
$secrect_num = Get-Random -Minimum 1 -Maximum 51
$attempts = 0
$Max_attepts = 7
$valid = $false
while($attempts -lt $Max_attepts)
{
    while(-not $valid)
    {
        $inputguess = Read-Host "Enter Your Guess "
        $valid = [int]::TryParse($inputguess,[ref]$guess)
        if(-not $valid)
        {
            Write-Host "Enter an Number Boi -_-"
        }
        elseif ($guess -lt 1 -or $guess -gt 50) 
        {
            Write-Host "Lock in Yo <>_<> The Number is Between 1 - 50 "
            $valid = $false
        }


    
    }
    
    $attempts++

    if ($guess -eq $secrect_num)
    {
        Write-Host "Daymm 'o' you found it"
         Start-Sleep -Seconds 1
        break
    }
    elseif ($guess -lt $secrect_num){
        
        Write-Host "Nice Try ! Lokey Try Harder (Higher >_0)"
         Start-Sleep -Seconds 1
        
    }
    else {
        Write-Host "Hmm yr not Good at this are you (Lower 0_<) "
         Start-Sleep -Seconds 1
    }
    $remaining = $Max_attepts - $attempts
    if($remaining -gt 0)
    {
        Write-Host "You got $remaining more tries left gl"
         Start-Sleep -Seconds 1
    }

    if($attempts -eq $Max_attepts)
    {
        Write-Host "Erm nt gng You Lost -_-"
        Start-Sleep -Seconds 0.5
        Write-Host "Good Luck Next Time >_<"
    }



        
}

