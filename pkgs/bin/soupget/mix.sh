{% extends '//lib/soup/3/mix.sh' %}

{% block bld_libs %}
{{super()}}
lib/glib/networking
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/examples/get ${out}/bin/
{% endblock %}
