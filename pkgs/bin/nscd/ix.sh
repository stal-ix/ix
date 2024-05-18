{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pikhq/musl-nscd/archive/refs/tags/v1.1.1.tar.gz
sha:ddd5924f0355568a483cb8c83e63c7e3425b8c3f1dce4b9883ca75ed1a276675
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block build %}
mkdir -p obj/src
{{super()}}
{% endblock %}
