{% extends '//bin/ya/t/2/ix.sh' %}

{% block git_commit %}
c35932419f4f9a4de7727108039ffceb1bc32c38
{% endblock %}

{% block git_sha %}
2808e91fa4c6df9ff195c51b70896f79c708250ce6ca17ff56fdba671d25d2df
{% endblock %}

{% block bld_tool %}
bin/gg
bin/ya/bootstrap/4(clang_ver=18)
{{super()}}
{% endblock %}

{% block ya_platform %}
{{super()}}
-k
{% endblock %}
