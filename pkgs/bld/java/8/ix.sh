{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/dl(dl_for=bld/java/8/libs,dl_lib=zip)
lib/dl(dl_for=bld/java/8/libs,dl_lib=nio)
lib/dl(dl_for=bld/java/8/libs,dl_lib=net)
lib/dl(dl_for=bld/java/8/libs,dl_lib=jvm)
lib/dl(dl_for=bld/java/8/libs,dl_lib=java)
lib/dl(dl_for=bld/java/8/libs,dl_lib=jsig)
lib/dl(dl_for=bld/java/8/libs,dl_lib=verify)
{% endblock %}

{% block bins %}
clhsdb
extcheck
hsdb
idlj
jar
jarsigner
java
java-rmi.cgi
javac
javadoc
javah
javap
jcmd
jconsole
jdb
jdeps
jhat
jinfo
jjs
jmap
jps
jrunscript
jsadebugd
jstack
jstat
jstatd
keytool
native2ascii
orbd
pack200
rmic
rmid
rmiregistry
schemagen
serialver
servertool
tnameserv
unpack200
wsgen
wsimport
xjc
{% endblock %}

{% block bld_tool %}
bld/wrap/cc/plugins/unreg(bins={{self.bins() | parse_list | fjoin(';')}})
{{super()}}
{% endblock %}

{% block postinstall %}
ln -s jvm/openjdk-1.8.0-internal/jre/lib ${out}/lib
touch ${out}/jvm/openjdk-1.8.0-internal/libzip.so
touch ${out}/jvm/openjdk-1.8.0-internal/libnio.so
{% endblock %}

{% block env %}
export JAVA_HOME=${out}
export JAVA=${out}/bin/java
export JAVACMD=${out}/bin/java
{% endblock %}

{% block cpp_defines %}
{{super()}}
signal=jdk_signal
sigset=jdk_sigset
sigaction=jdk_sigaction
{% endblock %}
