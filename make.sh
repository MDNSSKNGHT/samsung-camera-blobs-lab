#!/bin/bash

set -e

PRODUCT=$1

if [ -z $PRODUCT ]; then
    echo "usage: $0 <product>"
    exit -1
fi

7z a Module-$PRODUCT-$(date '+%Y%m%d-%H%M%S').zip ./module/* ./product/$PRODUCT

