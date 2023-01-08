{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot/efitools-1.9.2.tar.gz
sha:0f315b36e7d1ba74bfc97ab9f304f0a3072c47578bbe5e42594acae381f9acfe
{% endblock %}

{% block c_compiler %}
bin/gcc(for_target={{host.gnu.three}})
bin/gcc(for_target={{target.gnu.three}})
bin/binutils(for_target={{target.gnu.three}})
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/gnu/efi
{% endblock %}

{% block bld_tool %}
bin/openssl
{% endblock %}

{% block make_flags %}
BINDIR=${out}/bin
DOCDIR=${out}/doc
MANDIR=${out}/doc/man1
EFIDIR=${out}/share/efi
LOADLIBES=
LDSCRIPT=script
{% endblock %}

{% block build %}
>DB.crt
>PK.crt
>KEK.crt
>DB1.crt
>DB2.crt
>script
{{super()}}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
