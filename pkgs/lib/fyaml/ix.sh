{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/pantoniou/libfyaml/archive/refs/tags/v0.9.tar.gz
927306fc85c7566904751766d36178650766b34e59ce56882eaa5b60f791668c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
