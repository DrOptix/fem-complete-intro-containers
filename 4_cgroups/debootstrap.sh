#!/bin/bash

mkdir -p ./bionic
debootstrap --variant=minbase bionic ./bionic
