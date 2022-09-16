#!/bin/bash
VERSION=v0.1.0
sudo make docker-build docker-push IMG=docker.io/ktenzer/temporal-operator:$VERSION
sudo make bundle-build BUNDLE_IMG=docker.io/ktenzer/temporal-operator-bundle:$VERSION
sudo docker push docker.io/ktenzer/temporal-operator-bundle:$VERSION

