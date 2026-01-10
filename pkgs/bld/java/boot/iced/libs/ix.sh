{% extends '//bld/java/boot/iced/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/gif
lib/c++
lib/png
lib/jpeg
lib/alsa
lib/kernel
lib/lcms/2
lib/freetype
lib/shim/x11
lib/shim/iced
lib/shim/fake/cups
lib/shim/fake(lib_name=mawt)
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wrap/cc/plugins/norm
bld/wrap/cc/plugins/compile
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
find ${out} -type f -name '*.a' | while read l; do
    llvm-objcopy \
        --redefine-sym=signal=jdk_signal \
        --redefine-sym=sigset=jdk_sigset \
        --redefine-sym=sigaction=jdk_sigaction \
        ${l}
done
{% endblock %}

{% block c_rename_symbol %}
scalbn
copysign
atanh
finite
frexp
ilogb
ldexp
logb
modf
nextafter
rint
{% endblock %}
