{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
unbound
{% endblock %}

{% block version %}
1.24.1
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
4ca525436fef3a26ca767fcad8447ffd4585d44e3da0359867247c36653a3113
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
