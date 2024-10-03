{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/libnetfilter_cthelper
{% endblock %}

{% block git_branch %}
libnetfilter_cthelper-1.0.0
{% endblock %}

{% block git_sha %}
8f522272ae747c6f5cc1bf66713f967ce910577f5985b91392b69373615ad066
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

