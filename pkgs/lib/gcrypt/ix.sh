{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libgcrypt
{% endblock %}

{% block version %}
1.12.3
{% endblock %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-{{self.version().strip()}}.tar.bz2
98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e 's|#error|#warning|' -i random/jitterentropy-base.c
{% endblock %}

{% block configure_flags %}
{% if darwin or riscv64 %}
--disable-asm
{% endif %}
--disable-O-flag-munging
--disable-instrumentation-munging
{% endblock %}

{% block c_rename_symbol %}
gf_mul
{% endblock %}
