{% extends '//bin/jdk/7/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/gif
lib/c++
lib/png
lib/jpeg
lib/cups
lib/alsa
lib/kernel
lib/lcms/2
lib/freetype
lib/shim/iced
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
cp build/linux-amd64/tmp/java/fdlibm/obj64/libfdlibm.amd64.a ${out}/lib/
rm ${out}/lib/libsaproc.a
llvm-ar qL ${out}/lib/libjsig.a build/linux-amd64/lib/amd64/libjsig.so
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

{% block make_flags %}
{{super()}}
IMAGES_TARGET=
{% endblock %}
