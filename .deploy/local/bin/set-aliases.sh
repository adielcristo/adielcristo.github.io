#!/usr/bin/env bash

alias composer="dc \
    exec php composer $@"

alias dc="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    --file ${COMPOSE_PROJECT_DIR}/docker-compose.yaml \
    $@"

alias sculpin="dc \
    exec php vendor/bin/sculpin $@"

alias yarn="dc \
    exec node yarn $@"
