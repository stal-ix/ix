{% extends '//die/std/ix.sh' %}

{% include '//lib/evdev/t/ver.sh' %}

{% block install %}
mkdir -p ${out}/include
cp -R include/linux ${out}/include/
{% endblock %}
