{% extends '//die/c/autohell.sh' %}

{% block fetch %}
# 1.50 broke macos
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.50.tar.bz2
sha:69405349e0a633e444a28c5b35ce8f14484684518a508dc48a089992fe93e20a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/prepend
bld/fake/binutils(bin_prefix={{target.gnu.three}}-)
{% endblock %}

{% block patch %}
prepend src/spawn-posix.c << EOF
extern char** environ;
EOF
{% endblock %}

{% block configure_flags %}
--enable-install-gpg-error-config
{% endblock %}

{% block postinstall %}
echo 'need it for libassuan(and others) autoconf'
{% endblock %}

{% block env %}
export COFLAGS="--with-libgpg-error-prefix=${out} \${COFLAGS}"
{% endblock %}
