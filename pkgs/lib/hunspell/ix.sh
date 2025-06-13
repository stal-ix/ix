{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hunspell
{% endblock %}

{% block version %}
1.7.2
{% endblock %}

{% block fetch %}
https://github.com/hunspell/hunspell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
69fa312d3586c988789266eaf7ffc9861d9f6396c31fc930a014d551b59bbd6e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}
