{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%201.5.1/jamvm-1.5.1.tar.gz
663895bd69caf3a1fda6af5eea8263d90a5fd35ca8f4c32e2210ac410788901a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ffi
lib/shim/ix
bld/java/boot/classpath/93
bld/java/boot/classpath/93/dl
{% endblock %}

{% block bld_tool %}
bld/prepend
{% endblock %}

{% block configure_flags %}
--enable-ffi
--disable-int-caching
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
export JAVACMD=${out}/bin/jamvm
export CLASSPATH=${out}/lib/rt.jar
{% endblock %}
