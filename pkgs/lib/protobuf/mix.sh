{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.19.1.tar.gz
e5cb6707320a077f0618b669d1856bc4
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}
