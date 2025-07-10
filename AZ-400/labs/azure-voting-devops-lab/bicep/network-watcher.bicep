param location string

resource nw 'Microsoft.Network/networkWatchers@2022-09-01' = {
  name: 'NetworkWatcher_${location}'
  location: location
  properties: {}
}
