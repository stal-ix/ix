{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://archive.apache.org/dist/ant/source/apache-ant-1.9.16-src.tar.bz2
965489b1caca437b3c60f3885f7a671c8ea88610a650b4af883bf2b39e21530c
{% endblock %}

{% block bld_tool %}
bld/bash
bld/java/boot
{% endblock %}

{% block patch %}
sed -e 's|jars,test-jar|jars|' -i build.xml
{% endblock %}

{% block build %}
export BOOTJAVAC_OPTS="-cp src/main"
export ANT_OPTS=-Djava.io.tmpdir=${TMPDIR}
>${HOME}/.ant.properties
bash -x ./bootstrap.sh \
    -Djava.io.tmpdir=${TMPDIR} \
    -Dbuild.compiler=extJavac \
    -Ddist.dir=${out}
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
