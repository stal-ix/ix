{% extends '//bin/binutils/t/mix.sh' %}

{% block unpack %}
{{super()}}
cd gold
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/iberty
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-gold=yes
{% endblock %}

{% block patch %}
{{super()}}
cp bfdver.h ../bfd/
{% endblock %}
