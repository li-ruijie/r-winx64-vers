#!/usr/bin/env bash
function commit-r-version {
    local basedir="$(readlink -f "$1")"
    local rver="$2"
    local dirgit="$basedir/.git"
    local dirver="$basedir/$rver"

    mv "$dirgit" "$dirver/"     && \
        pushd "$dirver"         && \
        git checkout -b "$rver" && \
        git add -A              && \
        git commit -m "$rver"   && \
        mv "$dirver/.git" "$basedir/"
    while [ "$?" -ne 0 ]; do
        sleep 5s
        mv "$dirver/.git" "$basedir/"
    done
    popd
}
