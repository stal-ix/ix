{% extends '//die/c/make.sh' %}

{% block pkg_name %}
traceroute-for-linux
{% endblock %}

{% block version %}
2.1.6
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/traceroute/traceroute/traceroute-{{self.version().strip()}}/traceroute-{{self.version().strip()}}.tar.gz
sha:9ccef9cdb9d7a98ff7fbf93f79ebd0e48881664b525c4b232a0fcec7dcb9db5e
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block patch %}
sed -e 's|-lm||' -i Make.rules
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
CXX=clang++
{% endblock %}
