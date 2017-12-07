#!/bin/bash

synergy-service &
su $(id -nu $EXEC_UID) -c synergy-config
