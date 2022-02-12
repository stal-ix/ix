{% extends '//mix/std/mix.sh' %}

{% block fetch %}
https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz
sha:6f25bcb94d3e22fb52a4632c74e03b403834e81b68701ab7ecd900fb9cd89f43
{% endblock %}

{% block step_unpack %}
: skip unpack step
{% endblock %}

{% block install %}
cd ${out}

bsdtar -x -f ${src}/jdk*
ln -s jdk*/bin ./
{% endblock %}
