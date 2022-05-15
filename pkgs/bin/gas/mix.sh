{% extends '//bin/binutils/t/mix.sh' %}

{% block unpack %}
{{super()}}
cd gas
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/ctf
lib/bfd
lib/iberty
lib/opcodes
{% endblock %}

{% block bld_tool %}
bld/perl
bld/flex
bld/bison
bld/texinfo
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|../.*/lib.*a||g' -i Makefile
{% endblock %}

{% block make_flags %}
#target_alias=
{% endblock %}

{% block postinstall %}
:
{% endblock %}
