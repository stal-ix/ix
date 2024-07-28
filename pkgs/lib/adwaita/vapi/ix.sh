{% extends '//lib/adwaita/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
bin/vala
{% endblock %}
