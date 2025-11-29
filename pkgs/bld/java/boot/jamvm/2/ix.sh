{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%202.0.0/jamvm-2.0.0.tar.gz
76428e96df0ae9dd964c7a7c74c1e9a837e2f312c39e9a357fa8178f7eff80da
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ffi
lib/shim/ix
bld/java/boot/classpath/99
bld/java/boot/classpath/99/dl
{% endblock %}

{% block bld_tool %}
bld/prepend
{% endblock %}

{% block configure_flags %}
--enable-ffi
--disable-int-caching
--disable-int-inlining
--enable-runtime-reloc-checks
--with-classpath-install-dir=${out}
{% endblock %}

{% block c_flags %}
-Wno-implicit-function-declaration
-Wno-incompatible-pointer-types
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block patch %}
(base64 -d | patch -p2) << EOF
{% include 'fenv.patch/base64' %}
EOF
sed -e 's|"/tmp"|ix_temp_dir()|' -i src/properties.c
prepend src/properties.c << EOF
#include <ix.h>
EOF
{% endblock %}

{% block install %}
cp -R ${GNU_CLASSPATH}/share ${out}/
{{super()}}
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export JAVA_HOME=${out}
export JAVA=${out}/bin/jamvm
export JAVACMD=${out}/bin/jamvm
export CLASSPATH=${out}/lib/rt.jar
{% endblock %}
