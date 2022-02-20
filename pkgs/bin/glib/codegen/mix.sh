{% extends '//lib/glib/t/mix.sh' %}

{% block run_deps %}
# TODO(pg): fixme dep from bld/
bld/python
{{super()}}
{% endblock %}
