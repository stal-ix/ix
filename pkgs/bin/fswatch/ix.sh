{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fswatch
{% endblock %}

{% block version %}
1.22.0
{% endblock %}

{% block fetch %}
https://github.com/emcrisostomo/fswatch/archive/refs/tags/{{self.version().strip()}}.tar.gz
469bab7acb0405e1cead8a59576f8daa6fc720832db4baea20f1fa43edd66d38
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
