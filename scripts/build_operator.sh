oc get packagemanifests | grep $1

read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

read -p "Enter operator name: " operator

manifest=`oc get packagemanifests $operator -o json`

echo $manifest