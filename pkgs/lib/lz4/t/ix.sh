{% extends '//die/c/make.sh' %}

{% block pkg_name %}
lz4
{% endblock %}

{% block version %}
1.11.0
{% endblock %}

{% block fetch %}
https://github.com/lz4/lz4/archive/refs/tags/v{{self.version().strip()}}.tar.gz
247e5fa64da5f7b75ee3dd3bed484076396c9ebe8254d9ccf693eb62800c5e26
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
