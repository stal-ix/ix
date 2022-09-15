{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.0.3.tar.gz
sha:3b58185dfe5ea896efff7baeb12a7563d6b8b24b1dd60279834145031d420885
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --prefix=${out}
{% endblock %}
