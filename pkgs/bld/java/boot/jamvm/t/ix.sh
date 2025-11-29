{% extends '//die/c/autohell.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/ffi
lib/shim/ix
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

{% block build %}
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
