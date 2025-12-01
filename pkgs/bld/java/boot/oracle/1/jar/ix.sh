{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/openjdk.tar.bz2
14a9f90e2fe5c0bb73dc8ffcc9ea5dc76d3ce7a74a0c901cfd0b0ae3fc8c6450
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/corba.tar.bz2
df1154915cad317b93555b563fc12acad1b92e5f2870642736f186b7a4d80f14
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/hotspot.tar.bz2
9ae3d6d43ff771cf02b8c7805ac0f0a457f5fa7026b1334ea1085262d3d86d9d
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/jaxp.tar.bz2
143a5b957fbb00889ff9d38a4bf391218786b6a33664235279edbb6e79a3decc
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/jaxws.tar.bz2
d3e3d55d6e2231c4420d30d124f72c56695d45e8a398e3cc7ba21ff2a93c1284
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/jdk.tar.bz2
adbda93d1e9be89447e009733a6c9050c6e6cebda3c674a76ebbeb8986623534
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/langtools.tar.bz2
12036b985f8811cdadf6d5bf840f90bab25f4da1cc3e86bab9c3f6efcc10055b
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block parts %}
corba
hotspot
jaxp
jaxws
jdk
langtools
{% endblock %}

{% block bins %}
appletviewer
jarsigner
keytool
jar
native2ascii
serialver
javah
rmiregistry
tnameserv
orbd
rmid
rmic
{% endblock %}

{% block bld_tool %}
bld/java/boot/free
bld/java/boot/ant/9
bld/java/boot/ecj/5/javac
bld/java/boot/classpath/devel
{% endblock %}

{% block step_unpack %}
extract 1 ${src}/openjdk.tar.bz2
{% for x in ix.parse_list(self.parts()) %}
extract 0 ${src}/{{x}}.tar.bz2
mv {{x}}-* {{x}}
{% endfor %}
{% endblock %}

{% block patch %}
find . -type f -name '*.gmk' | while read l; do
    sed -e 's|/usr/bin/echo|echo|' \
        -e 's|/bin/echo|echo|' \
        -i ${l}
done
{% endblock %}

{% block build %}
export IX_CLASSPATH=${CLASSPATH}
export IX_JAVA_HOME=${JAVA_HOME}
mkdir -p prev/bin
cp -R ${JAVA_HOME}/* prev/
{% for x in ix.parse_list(self.bins()) %}
cat << EOF > prev/bin/{{x}}
#!/usr/bin/env sh
exec g{{x}} "\${@}"
EOF
{% endfor %}
cat << EOF > prev/bin/javac
#!/usr/bin/env sh
exec $(which javac) "\${@}"
EOF
cat << EOF > prev/bin/ant
#!/usr/bin/env sh
exec $(which ant) "\${@}"
EOF
cat << EOF > prev/bin/java
#!/usr/bin/env sh
exec jamvm -classpath \${IX_CLASSPATH} "\${@}"
EOF
chmod +x prev/bin/*
export IX_JAVACMD=${PWD}/prev/bin/java
export PATH=${PWD}/prev/bin:${PATH}
export IMPORT_JDK=${PWD}/jdk
export JAVA_HOME=${PWD}/prev
export ANT_OPTS=-Djava.io.tmpdir=${TMPDIR}
export BUILD_DIR=${PWD}/build

cd langtools/make

ant -Djdk.version=1.7.0 \
    -Dfull.version='1.7.0-internal-root_2025_12_01_15_31-b00' \
    -Dmilestone=internal \
    -Dbuild.number=b00 \
    -Djavac.target=7 \
    -Djavac.source=7 \
    -Dboot.java.home=${JAVA_HOME} \
    -Dimport.jdk=${IMPORT_JDK} \
    -Dbuild.dir=${BUILD_DIR} \
    -Ddist.dir=${BUILD_DIR} \
    build-bootstrap-javac
{% endblock %}

{% block install %}
mkdir ${out}/share
cp build/bootstrap/lib/javac.jar ${out}/share/
{% endblock %}

{% block env %}
export JAVAC_JAR=${out}/share/javac.jar
{% endblock %}
