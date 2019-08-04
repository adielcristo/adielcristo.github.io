#!/usr/bin/env bash

alias composer="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    exec php composer $@"

alias docker-build="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    build $@"

alias docker-down="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    down $@"

alias docker-logs="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    logs $@"

alias docker-restart="docker-down; docker-up"

alias docker-up="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    up -d $@"

alias php="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    exec php php $@"

alias sculpin="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    exec php vendor/bin/sculpin $@"

alias yarn="docker-compose \
    --project-directory ${COMPOSE_PROJECT_DIR} \
    exec node yarn $@"
