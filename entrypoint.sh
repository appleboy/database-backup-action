#!/bin/sh

set -eu

sh -c "/bin/docker-backup-database $*"
