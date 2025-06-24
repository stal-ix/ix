{% extends '//bin/ya/t/2/ix.sh' %}

{% block git_commit %}
680419f91ada0bced3af3c874d4028b19335dee3
{% endblock %}

{% block git_sha %}
42bbcc73b7cc5d85a630740f4320c3b4c9f4cc78e7da43ba665b12b51a7730d8
{% endblock %}

{% block bld_tool %}
bin/gg
bin/ya/bootstrap/5(clang_ver=18)
{{super()}}
{% endblock %}

{% block ya_platform %}
{{super()}}
-k
{% endblock %}
