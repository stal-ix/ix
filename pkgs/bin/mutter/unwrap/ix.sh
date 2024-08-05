{% extends '//bin/mutter/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
bin/mutter/plugin/dl
{% endblock %}
