{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/hoytech/lmdbxx/archive/refs/tags/1.0.0.tar.gz
sha:5e12eb3aefe9050068af7df2c663edabc977ef34c9e7ba7b9d2c43e0ad47d8df
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/lmdb
{% endblock %}
