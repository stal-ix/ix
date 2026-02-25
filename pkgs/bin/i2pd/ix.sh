{% extends '//die/c/make.sh' %}

{% block pkg_name %}
i2pd
{% endblock %}

{% block version %}
2.59.0
{% endblock %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/{{self.version().strip()}}.tar.gz
0ebeb05e4f36ab3809449561a095dc767ad821ac6a61c95623ab49be4ffd398b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/kernel
lib/openssl
lib/boost/85
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}
