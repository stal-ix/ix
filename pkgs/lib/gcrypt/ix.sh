{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.11.0.tar.bz2
sha:09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block setup_target_flags %}
export OPTFLAGS="${OPTFLAGS} -O2"
{% endblock %}

{% block patch %}
sed -e 's|#error|#warning|' -i random/jitterentropy-base.c
{% endblock %}

{% block configure_flags %}
{% if darwin %}
--disable-asm
{% endif %}
--disable-O-flag-munging
--disable-instrumentation-munging
{% endblock %}
