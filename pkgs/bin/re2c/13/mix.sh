{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/0.13.6.tar.gz
sha:a36b06083d903f092af32adeed4244d117871c33238256bd69faffb4712d9f8e
{% endblock %}

{% block unpack %}
{{super()}}
cd re2c
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/flex
bin/byacc
{% endblock %}
