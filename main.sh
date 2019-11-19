#!/bin/bash
echo "./main.sh <namespace> 'execute-command'"
echo ""
if [ $# != 2 ]; then
    echo "wrong number of arguments"
    exit 1
fi
echo "Commands to be executed on each host:"
echo "execute ${2}"
echo "namespace ${1}"
echo ""
hostfile=./host.txt
for exe_hosts in `cat ${hostfile} | grep -v ^#`
do
  echo ""
  echo "host:${exe_hosts}"
  echo "command:${2}"
  kubectl exec -i ${exe_hosts} ${2} -n ${1}
  echo ""
done
