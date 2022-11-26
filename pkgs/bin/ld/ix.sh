{% extends '//bin/binutils/t/ix.sh' %}

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
{{super()}}
bld/flex
bld/bison
{% endblock %}

{% block make_flags %}
{{super()}}
scriptdir=${out}/share
{% endblock %}

{% block install %}
{{super()}}
{% if bin_prefix %}
cd ${out}/bin
mkdir {{bin_prefix}}
ln -s ../{{bin_prefix}}ld {{bin_prefix}}/ld
{% endif %}
{% endblock %}
