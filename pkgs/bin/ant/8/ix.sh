{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://archive.apache.org/dist/ant/source/apache-ant-1.8.4-src.tar.bz2
5de65f7ba3f67e436ffffcdc0a73f591d1006e9fb41af8632c1f1f84d4a3e0b1
{% endblock %}

{% block bld_tool %}
bld/bash
bin/jikes
bin/jamvm
#bin/strace
{% endblock %}

{% block patch %}
sed -e 's|jars,test-jar|jars|' -i build.xml
{% endblock %}

{% block build %}
>${HOME}/.ant.properties
bash -x ./bootstrap.sh -Ddist.dir=${out}
{% endblock %}
