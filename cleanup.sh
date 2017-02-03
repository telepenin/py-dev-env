#!/usr/bin/env bash

if [ -z "$PROJECT_DIR" ]; then
    echo "ERROR: PROJECT_DIR env is empty"
    exit 1
fi

rm -rf "$PROJECT_DIR"/todomvc-backbone/bower_components
rm -rf "$PROJECT_DIR"/todomvc-django/db.sqlite3

echo "Cleanup successful"