#!/bin/sh -e

# Convert environment variables like PREFIX_A_B_C=123 to command line arguments like --a.b.c=123:
args="$(env | grep "^$ARG_PREFIX" | awk -F= -v prefix=$ARG_PREFIX \
'{
	arg=$1;
	value=$2;
	sub(prefix, "", arg);
	gsub("__", "-", arg);
	gsub("_", ".", arg);
	arg=tolower(arg);
	print "--"arg"="value
}')"

exec $ARG_COMMAND $args "$@"
