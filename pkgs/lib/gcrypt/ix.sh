{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libgcrypt
{% endblock %}

{% block version %}
1.11.2
{% endblock %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-{{self.version().strip()}}.tar.bz2
6ba59dd192270e8c1d22ddb41a07d95dcdbc1f0fb02d03c4b54b235814330aac
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
