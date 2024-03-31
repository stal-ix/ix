{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/qemacs/qemacs
{% endblock %}

{% block git_commit %}
06b3d373bbcc52b51ccb438bf3cab38a49492ff0
{% endblock %}

{% block git_sha %}
b0159b341c724e4e5e73bb45b31a3b4241056614e73de73d24db12a92ff5a3b1
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out} --disable-x11
{% endblock %}
