{% extends '//bin/ya/t/ix.sh' %}

{% block bld_tool %}
bin/ay
{{super()}}
{% endblock %}

{% block run_deps %}
bin/ya/tools/wrapper
{% endblock %}

{% block ya_make_bin %}
ay
{% endblock %}

{% block ya_make_options %}
-r
--build-dir=${tmp}/ya-build
--install=${tmp}/result
{% endblock %}

{% block configure_flags %}
--local-resources
{% endblock %}
