PORT_FORWARD_LOG="${{ runner.temp }}/k8s-pod-forward.log"
value='kubectl port-forward svc/krakend 8080 --namespace=frinx-machine < /dev/null &> "$PORT_FORWARD_LOG"'
while true; do
      echo "--> $value"
      $value 2>&1 >/dev/null |
      while IFS= read -r line
      do
            echo "### $line"
            if [[ "$line" == *"portforward.go"* ]]; then
                  echo "Retarting port forwarding $value"
                  exit 1
            else
                  exit 0
            fi
      done
      if [ $? -eq 0 ]; then
            break;
      fi
done