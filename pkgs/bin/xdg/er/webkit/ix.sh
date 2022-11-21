{% extends '//bin/xdg/er/ix.sh' %}

{% block wrapper_env %}
{{super()}}
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endblock %}
