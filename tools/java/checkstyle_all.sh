#!/bin/bash
#
# Run checkstyles on all java files at once
#

ROOT_DIR=`git rev-parse --show-toplevel`
JARS=`find $PWD/. -name "*\.jar" | tr '\n' ":"`
JAVA_FILES=`find $ROOT_DIR/{heron,tools,integration-test}/. -name "*.java"`
CONFIG=$ROOT_DIR/tools/java/src/com/twitter/bazel/checkstyle/coding_style.xml

(cd $ROOT_DIR java -cp $JARS com.puppycrawl.tools.checkstyle.Main -v -c $CONFIG $JAVA_FILES)