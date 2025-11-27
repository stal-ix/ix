{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%201.5.1/jamvm-1.5.1.tar.gz
663895bd69caf3a1fda6af5eea8263d90a5fd35ca8f4c32e2210ac410788901a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ffi
lib/gnu/classpath/93
lib/gnu/classpath/93/dl
{% endblock %}

{% block configure_flags %}
--with-classpath-install-dir=${out}
--disable-int-caching
--enable-runtime-reloc-checks
--enable-ffi
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
{% endblock %}

{% block install %}
cp -R ${GNU_CLASSPATH}/share ${out}/
{{super()}}
{% endblock %}
