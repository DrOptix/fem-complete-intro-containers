#!/bin/bash

# This will ramp up to consume ~1GB of RAM
yes | tr \\n x | head -c 1048576000 | grep n 
