{% extends '//bin/xdg/wrapper/ix.sh' %}

{% block xdg_wrapper_env %}
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endblock %}
