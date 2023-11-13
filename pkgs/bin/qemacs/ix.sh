{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/qemacs/qemacs
{% endblock %}

{% block git_commit %}
06b3d373bbcc52b51ccb438bf3cab38a49492ff0
{% endblock %}

{% block git_sha %}
2601362b6c56fa9985ed1cbad3729d264206f5fc0cd7d053e05f1c4199577a59
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out} --disable-x11
{% endblock %}
