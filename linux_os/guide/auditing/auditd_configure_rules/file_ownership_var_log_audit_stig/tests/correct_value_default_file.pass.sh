#!/bin/bash
# platform = multi_platform_ol,multi_platform_rhel,multi_platform_almalinux
# packages = audit

sed -i "/^\s*log_file.*/d" /etc/audit/auditd.conf
useradd testuser_123
touch "/var/log/audit/audit2.log"

chown root "/var/log/audit/audit.log"
chown testuser_123 "/var/log/audit/audit2.log"
