{% extends '//bin/ya/t/ix.sh' %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block git_commit %}
ff47bb5d587380afbc57da8a463f5f394ee8b528
{% endblock %}

{% block git_sha %}
8c53df0645d6127a109f48aa63a7578019967496b0b62b724ac0cc564ea13bd3
{% endblock %}

{% block bld_tool %}
bin/ya/0
{{super()}}
{% endblock %}
