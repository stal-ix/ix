{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hunspell
{% endblock %}

{% block version %}
1.7.3
{% endblock %}

{% block fetch %}
https://github.com/hunspell/hunspell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
933be3dac6fd55f6e752331a170efb7e33800e40fae1156d8434cc8c85379a1b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
