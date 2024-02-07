# Check if GitHub CLI (gh) is installed
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "GitHub CLI (gh) could not be found. Please install it first."
    exit 1
}

# Get the current branch name
$CURRENT_BRANCH = (git rev-parse --abbrev-ref HEAD)

# Check if we're in a git repository
if (-not $CURRENT_BRANCH) {
    Write-Host "Error: Not inside a Git repository."
    exit 1
}

# Check if a pull request already exists
$EXISTING_PR = gh pr list --head $CURRENT_BRANCH --state open --json number,url --jq '.[0]'

if ($EXISTING_PR) {
    # If a PR already exists, extract the number and URL
    $PR_NUMBER = ($EXISTING_PR | ConvertFrom-Json).number
    $PR_URL = ($EXISTING_PR | ConvertFrom-Json).url
    Write-Host "A pull request for branch $CURRENT_BRANCH already exists: $PR_URL"
} else {
    # If not, create a new PR and get the number of the new PR
    gh pr create --fill
    $CREATED_PR = gh pr list --head $CURRENT_BRANCH --state open --json number,url --jq '.[0]'
    $PR_NUMBER = ($CREATED_PR | ConvertFrom-Json).number
    $PR_URL = ($CREATED_PR | ConvertFrom-Json).url
    Write-Host "Pull request number $PR_NUMBER has been created: $PR_URL"
}

# Confirmation message
Write-Host "Pull request number $PR_NUMBER is currently open for branch $CURRENT_BRANCH."
