{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
fswatch
{% endblock %}

{% block version %}
1.18.3
{% endblock %}

{% block fetch %}
https://github.com/emcrisostomo/fswatch/archive/refs/tags/{{self.version().strip()}}.tar.gz
07f9fec15138fe25ea92d869117811c7c4fba2e6c6231682d49b159bae2ebd53
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
