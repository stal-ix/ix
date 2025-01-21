{% extends '//bin/bash/5/ix.sh' %}

{% block bld_tool %}
bld/wrapcc/link/xxx
{{super()}}
{% endblock %}
