{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.0.2.tar.gz
sha:efe22969dbb7729a3557b0309de7ddaa419cac9c7ce163c5807cab50af346016
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
