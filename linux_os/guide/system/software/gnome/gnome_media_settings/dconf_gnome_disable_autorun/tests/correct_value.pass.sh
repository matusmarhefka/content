#!/bin/bash
# packages = gdm,dconf
# profiles = xccdf_org.ssgproject.content_profile_stig

. $SHARED/dconf_test_functions.sh

install_dconf_and_gdm_if_needed
clean_dconf_settings

add_dconf_profiles
add_dconf_setting "org/gnome/desktop/media-handling" "autorun-never" "true" "local.d" "00-security-settings"
add_dconf_lock "org/gnome/desktop/media-handling" "autorun-never" "local.d" "00-security-settings"
