#! /bin/sh
#
# cursor.sh
# Copyright (C) 2015 takayuki <takayuki@Takayukis-MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#
for i in {0..255} ; do
  # printf "\x1b[38;05;255m 38;05;255m "
  printf "\x1b[\x34 q"
done
echo ''
