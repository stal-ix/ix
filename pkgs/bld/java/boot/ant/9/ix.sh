{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://archive.apache.org/dist/ant/source/apache-ant-1.9.0-src.tar.bz2
92d21bae9f739388b06087d322fa970945fa7e50ebd720ce4451e84a1f92bbc8
{% endblock %}

{% block bld_tool %}
bld/bash
bld/java/boot/ecj/4/javac/final
{% endblock %}

{% block patch %}
sed -e 's|jars,test-jar|jars|' -i build.xml
{% endblock %}

{% block build %}
>${HOME}/.ant.properties
bash -x ./bootstrap.sh -Dbuild.compiler=extJavac -Ddist.dir=${out}
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
{% for x in ix.parse_list(self.ant_jars()) %}
export CLASSPATH="${out}/lib/{{x}}:\${CLASSPATH}"
{% endfor %}
{% endblock %}
