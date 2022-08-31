{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz
sha:aef49cc7aa606de2044302e757fa94c8e144818e93487081c4fd319ca858134b
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
