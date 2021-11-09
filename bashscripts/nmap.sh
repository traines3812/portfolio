#!/bin/bash

echo enter target ip

read ip

sudo nmap -sS -sC -p- --script=default $ip -vv
