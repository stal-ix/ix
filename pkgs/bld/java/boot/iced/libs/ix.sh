{% extends '//bld/java/boot/iced/t/ix.sh' %}

{% block make_target %}
stamps/icedtea-boot.stamp
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
cp openjdk.build-boot/tmp/java/fdlibm/obj64/libfdlibm.amd64.a ${out}/lib/
llvm-ar qL ${out}/lib/libjsig.a openjdk.build-boot/lib/amd64/libjsig.so
llvm-objcopy \
    --redefine-sym=signal=bin_java_boot_iced_signal \
    --redefine-sym=sigset=bin_java_boot_iced_sigset \
    --redefine-sym=sigaction=bin_java_boot_iced_sigaction \
    ${out}/lib/libjsig.a
{% endblock %}

{% block c_rename_symbol %}
scalbn
copysign
{% endblock %}
