#!/bin/bash
# platform = Oracle Linux 8
# remediation = none

configfile=/etc/crypto-policies/back-ends/opensslcnf.config

echo "MinProtocol = TLSv1.2" > "$configfile"
