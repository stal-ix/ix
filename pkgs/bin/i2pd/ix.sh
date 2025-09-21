{% extends '//die/c/make.sh' %}

{% block pkg_name %}
i2pd
{% endblock %}

{% block version %}
2.58.0
{% endblock %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/{{self.version().strip()}}.tar.gz
5ff650c6da8fda3522c10ec22889a7fd1c6b5d1af42c24531d84c36f6cc49019
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
