{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
jsoncpp
{% endblock %}

{% block version %}
1.9.6
{% endblock %}

{% block fetch %}
https://github.com/open-source-parsers/jsoncpp/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:f93b6dd7ce796b13d02c108bc9f79812245a82e577581c4c9aabe57075c90ea2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
