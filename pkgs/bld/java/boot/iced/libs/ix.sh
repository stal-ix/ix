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
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
cp openjdk.build-boot/tmp/java/fdlibm/obj64/libfdlibm.amd64.a ${out}/lib/
rm ${out}/lib/libsaproc.a
llvm-ar qL ${out}/lib/libjsig.a openjdk.build-boot/lib/amd64/libjsig.so
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
{% endblock %}
