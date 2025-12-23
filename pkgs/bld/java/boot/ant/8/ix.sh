{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://archive.apache.org/dist/ant/source/apache-ant-1.8.4-src.tar.bz2
5de65f7ba3f67e436ffffcdc0a73f591d1006e9fb41af8632c1f1f84d4a3e0b1
{% endblock %}

{% block bld_tool %}
bld/bash
bld/java/boot/jikes
bld/java/boot/jamvm/1
{% endblock %}

{% block patch %}
sed -e 's|jars,test-jar|jars|' -i build.xml
{% endblock %}

{% block build %}
>${HOME}/.ant.properties
bash -x ./bootstrap.sh -Ddist.dir=${out}
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block ant_jars %}
ant-antlr.jar
ant-apache-bcel.jar
ant-apache-bsf.jar
ant-apache-log4j.jar
ant-apache-oro.jar
ant-apache-regexp.jar
ant-apache-resolver.jar
ant-apache-xalan2.jar
ant-commons-logging.jar
ant-commons-net.jar
ant-jai.jar
ant-javamail.jar
ant-jdepend.jar
ant-jmf.jar
ant-jsch.jar
ant-junit.jar
ant-junit4.jar
ant-launcher.jar
ant-netrexx.jar
ant-swing.jar
ant.jar
{% endblock %}

{% block env %}
{% for x in self.ant_jars() | parse_list %}
export CLASSPATH="${out}/lib/{{x}}:\${CLASSPATH}"
{% endfor %}
{% endblock %}
