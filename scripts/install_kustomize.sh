#!/bin/bash

curl -s "https://raw.githubusercontent.com/\
kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

mv kustomize /usr/local/bin/kustomize