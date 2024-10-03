{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
git://git.netfilter.org/libnftnl
{% endblock %}

{% block git_branch %}
libnftnl-1.2.8
{% endblock %}

{% block git_sha %}
4372748fa18d5414552a8e3cd4c306440543627a2c6694d92534126aba27cdf9
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}



