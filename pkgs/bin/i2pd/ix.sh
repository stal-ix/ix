{% extends '//die/c/make.sh' %}

{% block pkg_name %}
i2pd
{% endblock %}

{% block version %}
3.0.0.1
{% endblock %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/{{self.version().strip()}}.tar.gz
e82d4cdcce71180a42f89a753012db9aa303a792afc3e442802761f099ee39e4
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
