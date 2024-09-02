{% extends '//lib/ultra/hdr/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/opengl
lib/drivers/3d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/ultrahdr_app ${out}/bin/
{% endblock %}
