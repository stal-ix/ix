{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libffi
{% endblock %}

{% block version %}
3.8.0
{% endblock %}

{% block fetch %}
https://github.com/libffi/libffi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bf40d752d8f5fd4505bcd1c7d4208ea87fd12c91f087e359651c776748352dc0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}
