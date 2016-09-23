#!/bin/bash

if [ ! -f "${WORKDIR}/setup.lock" ]
then
  # chown files to running user
  if [ ! -z ${PUID+x} ]
  then
    usermod -d "${WORKDIR}" abc
    chown -R abc:abc "${WORKDIR}"
  fi
  touch ${WORKDIR}/setup.lock
fi
