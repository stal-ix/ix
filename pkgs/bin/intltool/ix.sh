{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
sha:67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd
{% endblock %}

{% block bld_tool %}
bld/perl/full
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
