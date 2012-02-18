#!/bin/bash

function failed()
{
  echo "Failed $*: $@" >&2
  exit 1
}

export OUTPUT=$WORKSPACE/output
rm -rf $OUTPUT
mkdir -p $OUTPUT

xcodebuild -target BaseAppKit -configuration Release build || failed build;

cd $WORKSPACE/build/Release-iphoneuniversal || failed output;
rm BaseAppKit
zip -r -y -9 $OUTPUT/BaseAppKit.framework.zip BaseAppKit.framework
