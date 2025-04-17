{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sysklogd
{% endblock %}

{% block version %}
2.7.2
{% endblock %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:baae08ffd1391dc5d6b233c716e52f82836eda4c6bb4870c858b8957c79e5028
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
