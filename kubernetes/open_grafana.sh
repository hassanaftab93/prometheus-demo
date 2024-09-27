# username: admin
# password: prom-operator

kubectl port-forward svc/kube-prometheus-stack-grafana 3000:80 -n prometheus &

# Wait for a few seconds to allow the port-forward to establish
sleep 5

# Function to open the browser based on the operating system
open_browser() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open http://localhost:3000
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    open http://localhost:3000
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    cygstart http://localhost:3000
  elif [[ "$OSTYPE" == "msys" ]]; then
    start http://localhost:3000
  else
    echo "Please open http://localhost:3000 manually in your browser."
  fi
}

# Open the browser
open_browser