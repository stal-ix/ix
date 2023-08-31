{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
OPENEXR_INSTALL_TOOLS=OFF
{% endblock %}
