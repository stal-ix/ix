{% extends '//die/c/make.sh' %}

{# need gnu-efi-libs #}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot/efitools-1.9.2.tar.gz
sha:0f315b36e7d1ba74bfc97ab9f304f0a3072c47578bbe5e42594acae381f9acfe
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
BINDIR=${out}/bin
DOCDIR=${out}/doc
MANDIR=${out}/doc/man1
EFIDIR=${out}/share/efi
{% endblock %}
