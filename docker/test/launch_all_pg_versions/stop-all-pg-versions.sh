#!/bin/bash

for ver in 9.{0..6} {10..12} ; do
  echo "stopping PG $ver ..."
  docker stop "pg${ver} pg${ver}-repl"
done
