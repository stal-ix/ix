{% extends '//bin/ya/t/1/ix.sh' %}

{% block git_commit %}
e7d6af6a60b41bd912f9723c946ba9464d7c8b31
{% endblock %}

{% block git_sha %}
f79044618d02b96d22aa9d0e4c51d94461e9261d1f81433d90b7e4b0e228975d
{% endblock %}

{% block bld_tool %}
bin/gg
bin/ya/bootstrap/0(clang_ver=18)
{{super()}}
{% endblock %}
