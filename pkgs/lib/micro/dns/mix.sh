{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/videolabs/libmicrodns/archive/refs/tags/0.2.0.tar.gz
sha:9864a088ffef4d4255d5abf63c6f603d1dc343dfec2809ff0c3f1624045b80fa
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
