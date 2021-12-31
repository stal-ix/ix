{% extends '//lib/drm/t/mix.sh' %}

{% block env %}
export DRM_DATA="${out}"
{% endblock %}
