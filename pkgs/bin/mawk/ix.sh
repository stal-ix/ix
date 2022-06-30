{% extends '//die/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/mawk/mawk-1.3.4-20200120.tgz
sha:7fd4cd1e1fae9290fe089171181bbc6291dfd9bca939ca804f0ddb851c8b8237
{% endblock %}

{% block bld_libs %}
lib/c
lib/readline
{% endblock %}

{% block bld_tool %}
bld/byacc
{% endblock %}
