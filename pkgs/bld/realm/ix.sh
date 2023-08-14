{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if materialize %}
bld/realm/materialize
{% else %}
bld/realm/symlink
{% endif %}
{% endblock %}
