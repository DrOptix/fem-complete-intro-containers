#!/bin/bash

mount -t proc proc /proc

ps aux

kill $(pgrep tail)

ps aux
