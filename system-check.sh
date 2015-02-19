#!/bin/bash

function check {
  msg=$1
  shift
  eval "$@" >/dev/null 2>&1

  if [ $? -eq 0 ]
  then
    echo "[✔] $msg" >&2
  else
    echo "[ ] $msg" >&2
    failed=1
  fi
}

failed=0

check "GCC installed"             'gcc --version'
check "Git installed"             'git --version'
check "Ruby 2.2.0 installed"      'ruby -v | grep "2.2.0"'
check "Bundler installed"         'gem list | grep "bundler"'
check "PostgreSQL installed"      'which psql'
check "pg gem installed"          'gem list | grep "pg"'
check "SQLite installed"          'which sqlite3'
check "sqlite3 gem installed"     'gem list | grep "sqlite3"'
check "nokogiri gem installed"    'gem list | grep "nokogiri"'
check "Node.js installed"         'node -v'
check "Heroku Toolbelt installed" 'which heroku'

if [ $failed -eq 0 ]
then
  bundle install && echo "Everything is working!"
fi
