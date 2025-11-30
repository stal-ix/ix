{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://bitbucket.org/cacaovm/cacao
{% endblock %}

{% block git_commit %}
6c4694f9bd175386a8c451531e9a5ad97aa23b6f
{% endblock %}

{% block git_sha %}
7e9d793f584ad4420dfd74b0596768de059ad8b615d97ce323d3899b9827588d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/ffi
lib/boehmgc
bld/java/boot/classpath/devel/dl
{% endblock %}

{% block configure_flags %}
--with-ffi
--disable-libjvm
--enable-gc=none
--enable-staticvm
--with-jni_h=${JNI_DIR}/include
--with-jni_md_h=${JNI_DIR}/include
--with-java-runtime-library-prefix=${out}
--with-java-runtime-library-libdir=${JNI_DIR}/lib
{% endblock %}

{% block bld_tool %}
bin/fastjar
bld/java/boot/ecj/4/javac
bld/java/boot/classpath/devel
{% endblock %}

{% block configure %}
export ac_cv_prog_junit_works=yes
export ac_cv_prog_jasmin_works=yes
cp -R ${GNU_CLASSPATH}/share ${out}/
{{super()}}
{% endblock %}

{% block cpp_defines %}
__va_copy=va_copy
__SIGRTMAX=SIGRTMAX
{% endblock %}

{% block patch %}
sed -e 's|(jobjectRefType) NULL|JNIInvalidRefType|' \
    -i src/native/jni.cpp
{% endblock %}

{% block env %}
export JAVA_HOME=${out}
export JAVA=${out}/bin/java
export JAVACMD=${out}/bin/java
export CLASSPATH=${out}/share/cacao/vm.zip
{% endblock %}
