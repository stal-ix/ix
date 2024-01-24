{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if target_materialize %}
bld/realm/materialize
{% else %}
bld/realm/symlink
{% endif %}
{% endblock %}
