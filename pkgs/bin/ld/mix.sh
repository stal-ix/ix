{% extends '//bin/binutils/t/mix.sh' %}

{% block unpack %}
{{super()}}
cd ld
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/ctf
lib/bfd
lib/iberty
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib/bfd*
echo 'keep ldscripts intact'
{% endblock %}
