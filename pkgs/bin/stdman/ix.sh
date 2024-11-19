{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jeaye/stdman/archive/refs/tags/2024.07.05.tar.gz
sha:3cd652cb76c4fc7604c2b961a726788550c01065032bcff0a706b44f2eb0f75a
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
