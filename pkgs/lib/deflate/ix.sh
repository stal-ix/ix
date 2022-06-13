{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.12.tar.gz
sha:ba89fb167a5ab6bbdfa6ee3b1a71636e8140fa8471cce8a311697584948e4d06
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
