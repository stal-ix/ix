{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libnetfilter_cthelper
{% endblock %}

{% block version %}
1.0.1
{% endblock %}

{% block git_repo %}
git://git.netfilter.org/libnetfilter_cthelper
{% endblock %}

{% block git_branch %}
libnetfilter_cthelper-{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
bef2d41e209ffb42110003647be403c8a6ecfe7f75af964632c46c0807dd392f
{% endblock %}

{% block lib_deps %}
lib/c
lib/mnl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
