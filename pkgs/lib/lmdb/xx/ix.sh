{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lmdbxx
{% endblock %}

{% block version %}
1.0.3
{% endblock %}

{% block fetch %}
https://github.com/hoytech/lmdbxx/archive/refs/tags/{{self.version().strip()}}.tar.gz
565cc859c47ad5dff1c10ecb66e88303f905da189efc9828bc0f968efccfff13
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/lmdb
{% endblock %}
