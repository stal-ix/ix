#!/bin/sh

exec unshare -U -r -m enclave_slave "${@}"
