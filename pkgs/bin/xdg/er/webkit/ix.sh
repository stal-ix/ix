{% extends '//bin/xdg/er/ix.sh' %}

{% block wrapper_env %}
{{super()}}
export WEBKIT_NICOSIA_PAINTING_THREADS=1
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endblock %}
