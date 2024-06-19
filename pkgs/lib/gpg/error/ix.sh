{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.49.tar.bz2
sha:8b79d54639dbf4abc08b5406fb2f37e669a2dec091dd024fb87dd367131c63a9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fake/binutils(bin_prefix={{target.gnu.three}}-)
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
