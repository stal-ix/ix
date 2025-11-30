{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://icedtea.classpath.org/download/source/icedtea-2.6.13.tar.xz
104e84205d1176e217e24f770784c53d1cd666aeb23ab0bae8ac858e5b0e63f0
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
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/openjdk.tar.bz2
14a9f90e2fe5c0bb73dc8ffcc9ea5dc76d3ce7a74a0c901cfd0b0ae3fc8c6450
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block step_unpack %}
{{super()}}
mkdir openjdk.src
for x in corba hotspot jaxp jaxws jdk langtools openjdk; do (
    cd openjdk.src
    mkdir ${x}
    cd ${x}
    extract 1 ${src}/${x}.tar.bz2
) done
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
bld/java/boot/classpath/devel
{% endblock %}

{% block bld_tool %}
bin/zip
bin/wget
bin/gzip
bld/perl
bin/unzip
bin/fastjar
bin/getconf
bin/xsltproc
bld/java/boot/ant/8
bld/java/boot/classpath/devel
bld/java/boot/ecj/4/javac/final
{% endblock %}

{% block configure_flags %}
--enable-bootstrap
--with-openjdk-src-dir=openjdk.src
--without-rhino
--with-java=${JAVA}
--disable-system-kerberos
--with-ecj=$(which javac)
--with-jdk-home=${GNU_CLASSPATH}
{% endblock %}
