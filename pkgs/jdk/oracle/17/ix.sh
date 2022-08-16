{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz
sha:50edb026947d5b2cb799fbc550ab62d3bec687691bade021139da4f1d9f1c21a
{% endblock %}

{% block step_unpack %}
: skip unpack step
{% endblock %}

{% block install %}
cd ${out}
bsdtar -x -f ${src}/jdk*
ln -s jdk*/bin ./
ln -s jdk*/lib ./
{% endblock %}

{% block postinstall %}
: nothing to do
{% endblock %}
