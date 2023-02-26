{% extends '//bin/xdg/er/ix.sh' %}

{% block wrapper_env %}
{{super()}}
{% if mesa_driver %}
export MESA_LOADER_DRIVER_OVERRIDE={{mesa_driver}}
{% endif %}
export WEBKIT_NICOSIA_PAINTING_THREADS=1
export WEBKIT_EXEC_PATH="\$(dirname \$(which WebKitWebProcess))"
{% endblock %}
