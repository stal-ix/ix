{% extends '//bin/ya/t/ymake/ix.sh' %}

{% block git_commit %}
46ab84268076f9b4cb8406f7844ee5e389295ca4
{% endblock %}

{% block git_sha %}
2e3f6b84cc7c30b5f3c773b1fe6783b07718c09c79f824a4847d0612230190d5
{% endblock %}

{% block bld_tool %}
bin/ya/2
bin/ya/1
{{super()}}
{% endblock %}