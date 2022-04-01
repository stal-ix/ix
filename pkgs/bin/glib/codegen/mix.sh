{% extends '//lib/glib/t/mix.sh' %}

{% block bld_libs %}
lib/intl/stub
{{super()}}
{% endblock %}

{% block run_deps %}
# TODO(pg): fixme dep from bld/
bld/python
{{super()}}
{% endblock %}
