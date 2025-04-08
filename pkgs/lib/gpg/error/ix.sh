{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.52.tar.bz2
sha:a1d3180cbdf07011e15931ed50561415af6b7305fe672d1cfa484a3dc7f49325
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
