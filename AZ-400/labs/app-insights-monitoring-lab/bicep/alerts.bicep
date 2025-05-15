resource highExceptionAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'HighExceptionRate-${environment}'
  location: location
  properties: {
    severity: 2
    enabled: true
    scopes: [
      resourceId('microsoft.insights/components', appInsightsName)
    ]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      odata.type: 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          metricName: 'exceptions/count'
          operator: 'GreaterThan'
          threshold: 5
          timeAggregation: 'Total'
          criterionType: 'StaticThresholdCriterion'
          name: 'ExceptionThreshold'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
