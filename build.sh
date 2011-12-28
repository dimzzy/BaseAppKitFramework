#!/bin/bash

function failed()
{
  echo "Failed $*: $@" >&2
  exit 1
}

export OUTPUT=$WORKSPACE/output
rm -rf $OUTPUT
mkdir -p $OUTPUT

/Developer/usr/bin/xcodebuild -target BaseAppKit -configuration Release build || failed build;
