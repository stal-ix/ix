{% extends '//bin/binutils/t/mix.sh' %}

{% block unpack %}
{{super()}}
cd binutils
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
bld/flex
bld/bison
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|../.*/lib.*a||g' -i Makefile.in
{% endblock %}

{% block make_flags %}
#target_alias=
{% endblock %}

{% block postinstall %}
:
{% endblock %}
