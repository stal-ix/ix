{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/realm/scripts
{% if target_allow_empty %}
bld/fake(tool_name=check_realm)
{% else %}
bld/realm/checker
{% endif %}
{% if target_materialize %}
bld/realm/materialize
{% else %}
bld/realm/symlink
{% endif %}
{{target_fixers}}
{% endblock %}
