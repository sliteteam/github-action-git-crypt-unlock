#!/bin/sh -l

EXPECTED_TEXT="this is a secret file"
TEXT=$(cat test.txt)

testIsUnlockingInTheRightWay() {
  assertEquals "$EXPECTED_TEXT" "$TEXT"
}

. /usr/bin/shunit2
