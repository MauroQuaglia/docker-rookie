#! /bin/bash

cp ~/mauro-quaglia/docker-rookie/ansible/roles/terminator/files/docker_monitor.config ~/.config/terminator/docker_monitor.config

terminator --config ~/.config/terminator/docker_monitor.config --maximise --layout="Docker Monitor"