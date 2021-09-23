#!/bin/sh

# Arguments are passed in from action.yml through the Dockerfile
API_URL=$1
FIXINATOR_PATH=$2
FIXINATOR_CONFIDENCE=$3
FIXINATOR_SEVERITY=$4
FIXINATOR_AUTOFIX=$5
FIXINATOR_RESULTFILE=$6
FIXINATOR_RESULTFORMAT=$7
FIXINATOR_IGNOREPATHS=$8
FIXINATOR_FAILONISSUES=$9

###
# CONFIGURATION
# Since Fixinator uses underscores in its module configuration, we can't do this with a simple env var substitution.
###
box config set modules.fixinator.api_key=$FIXINATOR_API_KEY
# if [[ -n $API_URL ]]; then
#     box config set modules.fixinator.api_url=$API_URL
# fi

###
# RUN IT
###
FIXINATOR_ARGS="path=$FIXINATOR_PATH confidence=$FIXINATOR_CONFIDENCE severity=$FIXINATOR_SEVERITY \
    autofix=$FIXINATOR_AUTOFIX resultFile=$FIXINATOR_RESULTFILE resultFormat=$FIXINATOR_RESULTFORMAT \
    ignorePaths=$FIXINATOR_IGNOREPATHS failOnIssues=$FIXINATOR_FAILONISSUES"
box fixinator $FIXINATOR_ARGS