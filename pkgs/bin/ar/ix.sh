{% extends '//bin/binutils/t/ix.sh' %}

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
