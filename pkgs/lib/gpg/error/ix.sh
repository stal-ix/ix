{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libgpg-error
{% endblock %}

{% block version %}
1.53
{% endblock %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-{{self.version().strip()}}.tar.bz2
sha:6a0721b52027415f53abcbf63b5c37776a0f774d9126d560a3ce76c0eb42903f
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
