{% extends '//lib/drm/t/ix.sh' %}

{% block use_data %}
lib/drm/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${DRM_DATA}"
{% endblock %}
