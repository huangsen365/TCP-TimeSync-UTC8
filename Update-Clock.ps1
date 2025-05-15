# https://chatgpt.com/c/c820722a-8561-401a-b084-e87daf9629a7

# Define the URL of the time API for UTC+8 (Asia/Singapore)
$timeApiUrl = "https://worldtimeapi.org/api/timezone/Asia/Singapore"

# Define the interval (24 hours)
$interval = 24 * 60 * 60  # in seconds

# Define the maximum retry attempts
$maxRetries = 100

# Run the time sync in an infinite loop
while ($true) {
    $attempt = 0
    $success = $false

    # Retry logic
    while ($attempt -lt $maxRetries -and -not $success) {
        try {
            # Send an HTTP GET request to the time API
            $response = Invoke-RestMethod -Uri $timeApiUrl -TimeoutSec 10

            # Extract the current time from the API response
            $currentTime = $response.datetime

            # Convert the current time to a DateTime object
            $currentTime = [DateTime]::Parse($currentTime)

            # Update the system clock
            Set-Date -Date $currentTime

            # Print status message with the current time
            Write-Host "Time successfully updated to: $currentTime" -ForegroundColor Green
            $success = $true  # Mark as successful to break out of the retry loop
        }
        catch {
            # Print an error message if something goes wrong
            Write-Host "Attempt $($attempt + 1) failed: Error - Unable to retrieve or update time." -ForegroundColor Red
        }

        # Increment attempt counter
        $attempt++

        if (-not $success) {
            Write-Host "Retrying... ($attempt of $maxRetries)" -ForegroundColor Yellow
        }
    }

    # If all attempts fail, print a final failure message
    if (-not $success) {
        Write-Host "Failed to update time after $maxRetries attempts." -ForegroundColor Red
    }

    # Wait for 24 hours before trying to update again (even if previous attempt failed)
    Write-Host "Waiting for next update..." -ForegroundColor Yellow
    Start-Sleep -Seconds $interval
}



