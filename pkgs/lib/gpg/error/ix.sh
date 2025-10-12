{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libgpg-error
{% endblock %}

{% block version %}
1.56
{% endblock %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-{{self.version().strip()}}.tar.bz2
82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0
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
