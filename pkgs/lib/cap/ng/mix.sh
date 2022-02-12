{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v0.8.2.tar.gz
sha:65b86885b8d873e55c05bd49427fd370d559b26f0c2089ac9194828e6a2fe233
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
