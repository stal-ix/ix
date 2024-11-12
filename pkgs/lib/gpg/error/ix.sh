{% extends '//die/c/autohell.sh' %}

{% block fetch %}
# 1.50 broke macos
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.51.tar.bz2
sha:be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2
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
