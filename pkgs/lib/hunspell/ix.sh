{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hunspell
{% endblock %}

{% block version %}
1.7.6
{% endblock %}

{% block fetch %}
https://github.com/hunspell/hunspell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4fa9c52a5337fb0a3e03f3212b6372d0159eac3d1a3e6e938e8897ff3d9c3d0c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
