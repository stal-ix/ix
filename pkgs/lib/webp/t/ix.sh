{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.3.2.tar.gz
sha:2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562aa09b4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
