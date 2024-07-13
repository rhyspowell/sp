oc get packagemanifests | grep $1

read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

read -p "Enter operator name: " operator

manifest=`oc get packagemanifests $operator -o json`
channel=`jq -r '.status.channels[].name' <<< $manifest`
currentCSV=`jq -r '.status.channels[].currentCSV' <<< $manifest`
catalogSource=`jq -r '.status.catalogSource' <<< $manifest`
namespace=`jq -r '.status.catalogSourceNamespace' <<< $manifest`

cat<<EOF> operator_subscription.yaml
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: $operator
  namespace: $namespace
spec:
  channel: $channel
  installPlanApproval: Automatic
  name: $operator
  source: $catalogSource 
  sourceNamespace: $namespace
  startingCSV: $currentCSV
EOF