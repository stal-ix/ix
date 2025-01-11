{% extends '//bin/ya/t/ymake/ix.sh' %}

{% block git_commit %}
eea1fb8c884fb069deea75baf3bcc470975d8876
{% endblock %}

{% block git_sha %}
99dbbe3254724b10d845f8878b2158a213eaf65dcb6d8bba7bf7e44f709b3dba
{% endblock %}

{% block bld_tool %}
bin/ya/0
bin/ya/gg
{{super()}}
{% endblock %}
