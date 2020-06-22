#!/bin/sh -l

EXPECTED_TEXT="this is a secret file\n"
TEXT=$(cat test.txt)

assertEquals "$EXPECTED_TEXT" "$TEXT"
