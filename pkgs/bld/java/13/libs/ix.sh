{% extends '//bld/java/13/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/kernel
lib/shim/iced
{% endblock %}

{# First pass: just the native libraries, as archives, for bld/java/13/unwrap
   to register; the image steps run the new launchers, which cannot load
   them yet. Only the registered ones are shipped: every archive here is
   linked everywhere downstream. #}

{% block jdk_targets %}
hotspot libs
{% endblock %}

{% block install %}
mkdir ${out}/lib
{% for l in self.dl_libs() | parse_list %}
cp ${tmp}/lib/lib{{l}}.a ${out}/lib/
llvm-objcopy --redefine-sym=JNI_OnLoad={{l}}_JNI_OnLoad ${out}/lib/lib{{l}}.a
{% endfor %}
{% endblock %}

{# fdlibm, compiled into libjava, defines these under the libc names #}
{% block c_rename_symbol %}
atanh
copysign
finite
frexp
ilogb
ldexp
logb
modf
nextafter
rint
scalb
scalbn
significand
{% endblock %}
