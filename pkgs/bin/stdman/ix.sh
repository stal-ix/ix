{% extends '//die/c/make.sh' %}

{% block pkg_name %}
stdman
{% endblock %}

{% block version %}
2024.07.05
{% endblock %}

{% block fetch %}
https://github.com/jeaye/stdman/archive/refs/tags/{{self.version().strip()}}.tar.gz
3cd652cb76c4fc7604c2b961a726788550c01065032bcff0a706b44f2eb0f75a
{% endblock %}

{% block bld_tool %}
bld/bash
bld/gzip
{% endblock %}

{% block configure %}
bash ./configure --prefix="${out}"
{% endblock %}

{% block build %}
:
{% endblock %}
