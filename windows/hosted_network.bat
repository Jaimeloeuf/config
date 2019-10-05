REM Use below command to create the hosted network
netsh wlan set hostednetwork mode=allow ssid=chicken key=password

REM Start the hosted network service
netsh wlan start hostednetwork

REM Show the hosted network service's properties
netsh wlan show hostednetwork

REM Stop the hosted network service
netsh wlan stop hostednetwork