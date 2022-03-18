#!/bin/bash

set -e

PRODUCT=$1

printerr() { echo $1; exit -1; }
substitute() { sed -i "s/$1/$2/g" $3; }

if [ -z $PRODUCT ]; then
    printerr "usage: $0 <product>"
else
    case $PRODUCT in
    'A50')
        VERSION=v1.0
        VERSIONCODE=1
        ;;
    'A51')
        VERSION=v1.0
        VERSIONCODE=1
        ;;
    'N10+')
        VERSION=v1.0
        VERSIONCODE=1
        ;;
    *)
        printerr "Couldn't find folder for $PRODUCT"
    esac
fi

# Replace identifiers in module/module.prop
substitute 'TARGET' $PRODUCT module/module.prop
substitute 'VERSIONCODE' $VERSIONCODE module/module.prop
substitute 'VERSION' $VERSION module/module.prop

# Replace identifiers in module/update.json
substitute 'TARGET' $PRODUCT module/update.json
substitute '-1' $VERSIONCODE module/update.json
substitute 'VERSION' $VERSION module/update.json

7z a Module-$PRODUCT-$(date '+%Y%m%d-%H%M%S').zip ./module/* ./product/$PRODUCT/*

