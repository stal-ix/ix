{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libgcrypt
{% endblock %}

{% block version %}
1.12.1
{% endblock %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-{{self.version().strip()}}.tar.bz2
7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c
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
