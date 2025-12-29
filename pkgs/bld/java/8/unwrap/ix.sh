{% extends '//bld/java/8/t/ix.sh' %}

{% block libs %}
zip
nio
net
jvm
java
jsig
verify
{% endblock %}

{% block bld_libs %}
{{super()}}
{% for l in self.libs() | parse_list %}
lib/dl(dl_for=bld/java/8/libs,dl_lib={{l}})
{% endfor %}
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
{% for l in self.libs() | parse_list %}
touch ${out}/jvm/openjdk-1.8.0-internal/lib{{l}}.so
{% endfor %}
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
