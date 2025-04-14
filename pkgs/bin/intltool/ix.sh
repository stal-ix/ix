{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
intltool
{% endblock %}

{% block version %}
0.51.0
{% endblock %}

{% block fetch %}
https://launchpad.net/intltool/trunk/{{self.version().strip()}}/+download/intltool-{{self.version().strip()}}.tar.gz
sha:67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd
{% endblock %}

{% block bld_tool %}
bld/perl/full
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
