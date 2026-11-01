{% extends '//bin/java/11/t/ix.sh' %}

{# Second pass: the same build, now with the native libraries of
   bin/java/11/libs registered for dlopen, so the launchers run. #}

{% block bld_libs %}
{{super()}}
{% for l in self.dl_libs() | parse_list %}
lib/dl(dl_for=bin/java/11/libs,dl_lib={{l}})
{% endfor %}
{% for l in self.dl_onload_libs() | parse_list %}
lib/dl/fix(dl_for=bin/java/11/libs,dl_lib={{l}},dl_symbols=JNI_OnLoad={{l}}_JNI_OnLoad)
{% endfor %}
{% for l in self.dl_agent_libs() | parse_list %}
lib/dl/fix(dl_for=bin/java/11/libs,dl_lib={{l}},dl_symbols=Agent_OnLoad={{l}}_Agent_OnLoad)
lib/dl/fix(dl_for=bin/java/11/libs,dl_lib={{l}},dl_symbols=Agent_OnUnload={{l}}_Agent_OnUnload)
{% endfor %}
{% endblock %}

{# the launchers that get the registrations; not unpack200, which is all
   native, with the code of libunpack compiled in #}
{% block bins %}
appletviewer
idlj
jar
jarsigner
java
javac
javadoc
javah
javap
jcmd
jconsole
jdb
jdeprscan
jdeps
jhsdb
jimage
jinfo
jjs
jlink
jmap
jmod
jps
jrunscript
jshell
jstack
jstat
jstatd
keytool
orbd
pack200
rmic
rmid
rmiregistry
schemagen
serialver
servertool
tnameserv
wsgen
wsimport
xjc
{% endblock %}

{% block bld_tool %}
bld/wrap/cc/plugins/unreg(bins={{self.bins() | parse_list | fjoin(';')}})
{{super()}}
{% endblock %}

{# the JDK keeps its lib/ (modules, the .so names it opens), which a bin
   package would lose at the top level #}
{% block install %}
mkdir ${out}/jvm
cp -R build/*-release/images/jdk ${out}/jvm/jdk
ln -s jvm/jdk/bin ${out}/bin
{% endblock %}

{# the native libraries are linked into the launchers, but the JDK still
   checks that their files exist: keep them, emptied #}
{% block purge_dynlib %}
find ${out} -name '*.so' | while read l; do
    >${l}
done
{% endblock %}

{% block env %}
export JAVA_HOME=${out}/jvm/jdk
export JAVA=${out}/jvm/jdk/bin/java
export JAVACMD=${out}/jvm/jdk/bin/java
{% endblock %}
