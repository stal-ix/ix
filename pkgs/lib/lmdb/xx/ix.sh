{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lmdbxx
{% endblock %}

{% block version %}
1.0.2
{% endblock %}

{% block fetch %}
https://github.com/hoytech/lmdbxx/archive/refs/tags/{{self.version().strip()}}.tar.gz
3ae81209dbcf274002309c538f0cace34f3cb51e75568b2f64aaa30f0d50ac28
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/lmdb
{% endblock %}
