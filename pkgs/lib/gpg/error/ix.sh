{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libgpg-error
{% endblock %}

{% block version %}
1.58
{% endblock %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-{{self.version().strip()}}.tar.bz2
f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27
{% endblock %}

{% block lib_deps %}
lib/c
{% if mingw32 %}
lib/shim/dll(dll_name=user32)
lib/shim/dll(dll_name=advapi32)
{% endif %}
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/prepend
bld/fake/binutils(bin_prefix={{target.gnu.three}}-)
{% endblock %}

{% block patch %}
{% if freebsd %}
sed -e 's|linux-musl|freebsd|' -i configure
{% endif %}
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
