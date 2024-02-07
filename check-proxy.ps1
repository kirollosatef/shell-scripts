$env:http_proxy = "http://185.156.111.114:63974:7hx8w3bD:8URbKcS4/"
$URL = "www.google.com"

$proxyCredential = New-Object System.Management.Automation.PSCredential("test", (ConvertTo-SecureString "test" -AsPlainText -Force))

$response = Invoke-WebRequest -Uri $URL -ProxyCredential $proxyCredential -UseProxy

if ($response.StatusCode -eq 200) {
    $STATUS = "Proxy is working."
} else {
    $STATUS = "Proxy isn't working."
}

Write-Output $STATUS
