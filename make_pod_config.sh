echo "./make_pod_config.sh <namespace>"
if [ $# != 1 ]; then
    echo "wrong number of arguments"
    exit 1
fi

kubectl get pod -n ${1} | grep Running | awk '{print $1;}'
