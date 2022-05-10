{% extends '//bin/heirloom/t/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/8/env/std
{% endblock %}

{% block postinstall %}
cd ${out}
mkdir lib
mv bin/lib/libl.a lib/
{% endblock %}

{% block install %}
cd ${out}/bin; rm yacc
{% endblock %}
