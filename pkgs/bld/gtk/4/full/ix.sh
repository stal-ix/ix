{% extends '//lib/gtk/4/t/ix.sh' %}

{% block ninja_build_targets %}
tools/gtk4-update-icon-cache
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/tools/gtk4-update-icon-cache ${out}/bin/
{% endblock %}
