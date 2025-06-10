{% extends '//die/c/make.sh' %}

{% block pkg_name %}
i2pd
{% endblock %}

{% block version %}
2.57.0
{% endblock %}

{% block fetch %}
https://github.com/PurpleI2P/i2pd/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:e2327f816d92a369eaaf9fd1661bc8b350495199e2f2cb4bfd4680107cd1d4b4
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
