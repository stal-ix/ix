{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
webp
{% endblock %}

{% block version %}
1.6.0
{% endblock %}

{% block fetch %}
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-{{self.version().strip()}}.tar.gz
e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
