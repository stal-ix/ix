{% extends '//die/hub.sh' %}

{% block lib_deps %}
bld/boot/1/lib/musl/{{target.gnu_arch}}
{% endblock %}
