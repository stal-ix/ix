{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sysfsutils
{% endblock %}

{% block version %}
2.1.1
{% endblock %}

{% block fetch %}
https://github.com/linux-ras/sysfsutils/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f7f669d27c997d3eb3f3e014b4c0aa1aa4d07ce4d6f9e41fa835240f2bf38810
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
