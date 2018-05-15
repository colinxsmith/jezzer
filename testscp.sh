#!/bin/sh

cat tt|ssh colinubuntu32 'cat > ~/tt1'
ssh colinubuntu32 'ls -l tt1'

if $(ssh colinubuntu32 rm ~/tt1)
then
  echo "Should have been removed"
else
  echo "wasn't there"
fi

ssh colinubuntu32 'ls -l tt1'

if ! [ -f tt ]
then
  echo "Should have failed"
  if $(ssh colinubuntu32 rm ~/tt1)
  then
    echo "Should have been removed"
  else
    echo "wasn't there"
  fi
fi
