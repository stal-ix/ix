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

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/flex
bld/bison
{% endblock %}
