$highscorefile = Join-Path $PSScriptRoot "highscores.txt"
if(Test-Path $highscorefile)
{
  $highscores = @(Get-Content $highscorefile)
  if($highscores.Count -lt 2)
  {
    $highscores = @(0,0)
  }
}
else 
{
  $highscores = @(0,0)
}

function Start-NumberGuessing
{

Write-Host "++--++--++--++--++--++--++--++--++--++" 
Write-Host "++--++--++ GUESS THE NUMBER ++--++--++"
Write-Host "++--++--++--++--++--++--++--++--++--++"
Start-Sleep -Seconds 1
Write-Host "Hey Welcome 0.0 ! "
Start-Sleep -Seconds 1
Write-Host "Are you ready to guess THE SECRET NUMBER ?"
Start-Sleep -Seconds 1
Write-Host "I hope so cuz am about to start with it 0_<"
Start-Sleep -Seconds 1
$Guess_running = $true
while ($Guess_running)
{
Write-host "--Difficulty--"
Write-Host "1.[ Easy ]"
Write-Host "2.[ Normal ]"
Write-Host "3.[ Hard ]"
Write-Host "4.[ Back to Menu ]"
$attempts = 0
$difficultyvalid = $false
while(-not $difficultyvalid)
{
    $difficulty = Read-Host "Yr Choice "
switch ($difficulty) 
{
   
    "1" 
    {
     $Max_number = 50
     $Max_attepts = 10
     $difficultyvalid = $true
    }
    "2"
    {
     $Max_number = 70
     $Max_attepts = 6
     $difficultyvalid = $true
    }
    "3"
    {
     $Max_number = 100
     $Max_attepts = 5
     $difficultyvalid = $true
    }
    "4"
    {
     return
     
    }
    Default 
    {
      Write-Host "Enter Valid Choice"
      
    }
}
}
$won = $false
$secrect_num = Get-Random -Minimum 1 -Maximum($Max_number + 1)
Write-Host "Ight the SECRECT NUMBER is between 1 and $Max_number"
while($attempts -lt $Max_attepts)
{
    $valid = $false
    $guess = 0
    while(-not $valid)
    {
        $inputguess = Read-Host "Enter Your Guess "
        $valid = [int]::TryParse($inputguess,[ref]$guess)
        if(-not $valid)
        {
            Write-Host "Enter an Number Boi -_-"
        }
        elseif ($guess -lt 1 -or $guess -gt $Max_number) 
        {
            Write-Host "Lock in Yo <>_<> The Number is Between 1 - $Max_number "
            $valid = $false
        }


    
    }
    
    $attempts++

    if ($guess -eq $secrect_num)
    {
        $won = $true
        Write-Host "'o' you found it"
        break
      
         
    }
    elseif ($guess -lt $secrect_num){
        
        Write-Host "Nice Try ! Lokey Try Harder (Higher >_0)"
         Start-Sleep -Milliseconds 50
        
    }
    else {
        Write-Host "Hmm yr not Good at this are you (Lower 0_<) "
         Start-Sleep -Milliseconds 50
    }
    $remaining = $Max_attepts - $attempts
    if($remaining -gt 0)
    {
        Write-Host "You got $remaining more tries left gl"
         Start-Sleep -Milliseconds 50
    }
   

    <#if($attempts -eq $Max_attepts)
    {
        Write-Host "Erm nt gng You Lost -_-"
        Start-Sleep -Seconds 0.5
        Write-Host "Good Luck Next Time >_<"
        $again = Read-Host "Do you wanna try again (Y/N) "
   if ($again -eq "Y")
    {
    $Guess_running = $true
    }
    elseif($again -eq "N")
    {
    $Guess_running = $false
    }
    else 
    {
    Write-Host "Bruh enter an actual option"
    }   
    
         
    }#>

  

  }
  if($won)
  {
  $remaining = $Max_attepts - $attempts + 1
  if($difficulty -eq "1")
    {
      $score = $remaining
    }
    elseif($difficulty -eq "2")
    {
      $score = $remaining*3
    }
    elseif($difficulty -eq "3")
    {
      $score = $remaining*10
    }
  }
  else 
  {
    $score = 0
    Write-Host "You Lost Better Luck Next Time"
  }
  if($score -gt [int]$highscores[0])
  {
    $highscores[0] = $score
    Set-Content -Path $highscorefile -Value @($highscores[0],$highscores[1])
    Write-Host "New Highscore !!"
  }
  $endmenue = $true
  while($endmenue)
  {
    

  
  Write-Host "++--++--++--++--++---++"
  Write-Host "++--++ GAME OVER ++--++"
  Write-Host "++--++--++--++--++---++"
  Write-Host "Yr Score is [ $score ] !"
  Write-Host "1.[ Play Again ]"
  Write-Host "2.[ Back to Menu ]"
  $endchoice = Read-Host "Yr Choice "

   switch ($endchoice) 
  {
    "1"
    {
        $endmenue = $false
    }
    "2"
    {
        return
    }
    Default 
    {
      Write-Host "Invalid Choice"
    }
  }
  }
  
}


}


function Start-MathGame 
{
  Write-Host "++--++--++--++--++--++--++---++"
  Write-Host "++--++--++ MATH GAME ++--++--++"
  Write-Host "++--++--++--++--++--++--++---++"
  Start-Sleep -Seconds 1
  Write-Host "Welcome 0.0 ! "
  Start-Sleep -Seconds 1
  Write-Host "Are You ready to Test yr Math Skill"
  Start-Sleep -Seconds 1
  Write-Host "Ight Lets Start >_<"
  Start-Sleep -Seconds 1
  $gamerunning = $true
  while($gamerunning)
{
  Write-Host "--Difficulty--"
  Write-Host "1.[ Easy ]"
  Write-Host "2.[ Normal ]"
  Write-Host "3.[ Hard ]"
  Write-Host "4.[ Back to Menu ]"
  $difficultyvalid = $false
  while(-not $difficultyvalid)
  {
    $difficulty = Read-Host "Choose yr difficuity"
    switch($difficulty)
    {
     "1"
     {
      $timelimit = 60
      $Maxnum = 20
      $difficultyvalid = $true
     }
     "2"
     {
      $timelimit = 45
      $Maxnum = 40
      $difficultyvalid = $true
     }
     "3"
     {
      $timelimit = 30
      $Maxnum = 100
      $difficultyvalid = $true
     }
     "4"
     {
      return
     }
     default
     {
      Write-Host "Bruh Enter a valid Choice "
     }
 
    }
  }

  Write-host "Yr Time limit is $timelimit sec gl >_o"
  
  
  Write-Host "Les Go !"
  
  

  $starttime = Get-Date
  $score = 0
  while($true)
  {
  $num1 = Get-Random -Minimum 1 -Maximum($Maxnum + 1)
  $num2 = Get-Random -Minimum 1 -Maximum($Maxnum + 1)
  $op = Get-Random -InputObject @("+","-","*")
  if($num1 -lt $num2)
  {
    $temp = $num1
    $num1 = $num2
    $num2 = $temp
  }
    

  switch ($op) 
  {
    "+"
    { 
      $r_ans = $num1 + $num2
    }
    "-"
    {
      $r_ans = $num1 - $num2
    }
    "*"
    {
      $r_ans = $num1 * $num2
    }
    Default 
    {
      
    }
}
    $answer = ""
    $submitted = $false
    $timeup = $false

    Write-Host "$num1 $op $num2 = " -NoNewline
    while(-not $submitted)
    {
      $elapsed = (Get-Date) - $starttime
      $remaining = $timelimit - $elapsed.TotalSeconds

      if($remaining -lt 0)
      {
        $timeup = $true
        break
      }
      if([Console]::KeyAvailable)
      {
        $key = [Console]::ReadKey($true)
        
        if($Key.Key -eq "Enter")
        {
          $submitted = $true
        }
        elseif($Key.Key -eq "Backspace")
        {
           if($answer.Length -gt 0)
           {
             $answer = $answer.Substring(0,$answer.Length - 1)
             Write-Host "`b `b" -NoNewline
           }
        } 
        elseif($Key.KeyChar -match '^[0-9]$' )
        {
          $answer += $Key.KeyChar
          Write-Host $key.KeyChar -NoNewline
        }
      }
      Start-Sleep -Milliseconds 50
    }
    if($timeup)
    {
      Write-host "Times Up"
      break

    }

    $number = 0
    $valid = [int]::TryParse($answer,[ref]$number)
    if(-not $valid)
    {
        Write-Host " Enter A Number Boi "
        continue
    }
    elseif($number -eq $r_ans)
    {
        $score++
        Write-Host " Correct !"
       
    }
    else 
    {
       Write-Host " Nt buddy the ans was $r_ans"
    }
  }

  if($difficulty -eq "2")
    {
      $score = $score*2
    
    }
    elseif($difficulty -eq "3")
    {
      $score = $score*3
      
    }

  if($score -gt [int]$highscores[1])
  {
    $highscores[1] = $score
    Set-Content -Path $highscorefile -Value @($highscores[0],$highscores[1])
    Write-Host "New Highscore !!"
  }
 
  $endmenue = $true
  while($endmenue)
  {
    
  Write-Host "++--++--++--++--++---++"
  Write-Host "++--++ GAME OVER ++--++"
  Write-Host "++--++--++--++--++---++"
  Write-Host "Yr Score is [ $score ] !"
  Write-Host "1.[ Play Again ]"
  Write-Host "2.[ Back to Menu ]"
  $endchoice = Read-Host "Yr Choice "

   switch ($endchoice) 
  {
    "1"
    {
        $endmenue = $false
    }
    "2"
    {
        return
    }
    Default 
    {
      Write-Host "Invalid Choice"
    }
  }
  }
  
}
}
 


$running = $true
while ($running)
{
Clear-Host
Write-Host "++--++--++--++--++--++--++--++--++"
Write-Host "++--++--++ NUMBER GAME--++--++--++"
Write-Host "++--++--++--++--++--++--++--++--++"
Write-Host " --Main Menu--"
Write-Host "1.[ Guess The Number ]"
Write-Host "2.[ Math Game ]"
Write-Host "3.[ High Scores ]"
Write-Host "4.[ Exit Game ]"

$choice = Read-Host "Yr Choice "

switch ($choice)
 {
    "1"
    {  
      
     Start-NumberGuessing

    }
    "2"
    {
      Start-MathGame
    }
    "3"
    {
      Clear-Host
      Write-Host "++--++--++--++--++--++-++"
      Write-Host "++--++ High Scores ++--++"
      Write-Host "++--++--++--++--++--++-++"
      Write-Host "Guess The Number : $($highscores[0])"
      Write-Host "Math Game : $($highscores[1])"
      Write-Host ""
      Write-Host "1.[ Rest Score ]"
      Write-Host "2.[ Back to Menu ]"
      $Scoreans = Read-Host "Yr Choice "
      switch($Scoreans)
      {
        "1"
        {
          $ans = Read-Host "Are you Sure [Y/N] "
          if($ans -eq "Y")
          {
            $highscores = $(0,0)
            Set-Content -Path $highscorefile -Value @($highscores[0],$highscores[1])
            Write-Host "Scores Resetted Successfully"
            Start-Sleep -Seconds 1
          }
          elseif($ans -eq "N")
          {
            Write-Host "Rest Cancelled"
          }
        }
        "2"
        {
          break
        }
      }
    }
    "4"
    {
      Write-Host "Exiting game Thanks For Playing"
      $running = $false
    }
    Default 
    {
      Write-Host "Invalid Choice"
    }
}

}
