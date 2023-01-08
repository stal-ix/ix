{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/vstakhov/libucl/archive/refs/tags/0.8.2.tar.gz
sha:d95a0e2151cc167a0f3e51864fea4e8977a0f4c473faa805269a347f7fb4e165
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
