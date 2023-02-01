{% extends '//die/c/autohell.sh' %}

{% block bld_libs %}
lib/c
lib/gmp
lib/intl
lib/sigsegv
lib/openssl/1
{% if linux %}
lib/acl
lib/cap
lib/attr
lib/shim/extra
{% endif %}
{% endblock %}

{% block configure_flags %}
--libexecdir="${out}/bin"
--enable-no-install-program=stdbuf
--enable-single-binary=symlinks
{% endblock %}

{% block patch %}
(cd src && patch) << EOF
{% include 'uname.patch' %}
EOF
{% endblock %}

{% block configure %}
{{super()}}
cat Makefile | grep -v 'LIBINTL = ' > _ && mv _ Makefile
{% endblock %}
