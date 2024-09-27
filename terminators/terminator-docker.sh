#! /bin/bash

cp ~/mauro-quaglia/docker-rookie/ansible/roles/terminator/files/docker_vinc.config ~/.config/terminator/docker_vinc.config

terminator --config ~/.config/terminator/docker_vinc.config --maximise --layout=Docker