{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.22.0
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
sha:4e32a36d57cda666b1c8ee02185ba73462330452162d1b9c31a5b91a853ba946
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
