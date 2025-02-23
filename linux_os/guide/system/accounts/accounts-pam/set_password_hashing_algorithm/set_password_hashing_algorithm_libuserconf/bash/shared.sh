# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle,multi_platform_almalinux

{{{ bash_instantiate_variables("var_password_hashing_algorithm_pam") }}}
LIBUSER_CONF="/etc/libuser.conf"
CRYPT_STYLE_REGEX='[[:space:]]*\[defaults](.*(\n)+)+?[[:space:]]*crypt_style[[:space:]]*'

# Try find crypt_style in [defaults] section. If it is here, then change algorithm to sha512.
# If it isn't here, then add it to [defaults] section.
if grep -qzosP $CRYPT_STYLE_REGEX $LIBUSER_CONF ; then
        sed -i "s/\(crypt_style[[:space:]]*=[[:space:]]*\).*/\1$var_password_hashing_algorithm_pam/g" $LIBUSER_CONF
elif grep -qs "\[defaults]" $LIBUSER_CONF ; then
        sed -i "/[[:space:]]*\[defaults]/a crypt_style = $var_password_hashing_algorithm_pam" $LIBUSER_CONF
else
        echo -e "[defaults]\ncrypt_style = $var_password_hashing_algorithm_pam" >> $LIBUSER_CONF
fi
