{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/build/muldefs
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=zip)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=nio)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=net)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=jvm)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=java)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=jsig)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=verify)
{% endblock %}

{% block bld_tool %}
bld/wrapcc/link/plugins/reg(bins=gamma)
{{super()}}
{% endblock %}

{% block script_init_env %}
export PLUGINS=
{{super()}}
{% endblock %}

{% block cpp_defines %}
{{super()}}
signal=jdk_signal
sigset=jdk_sigset
sigaction=jdk_sigaction
{% endblock %}

{% block install %}
set -x
cp -R openjdk.build-boot/j2sdk-image/* ${out}/
cp -R openjdk.build-boot/hotspot/outputdir/linux_amd64_compiler2/product/gamma ${out}/bin/hotspot
>${out}/bin/libjvm.so
base64 -d << EOF > ${out}/bin/java
{% include 'java.py/base64' %}
EOF
chmod +x ${out}/bin/java
cat << EOF > launcher
#!/usr/bin/env python3
D = '''
EOF
base64 -d << EOF > flt.py
{% include 'flt.py/base64' %}
EOF
(
    find openjdk.src/jdk -type f -name Makefile | grep -v launchers | while read l; do
        cat ${l}
    done
    cat openjdk.src/jdk/make/launchers/Makefile
) | python3 flt.py >> launcher
cat << EOF >> launcher
'''
EOF
base64 -d << EOF >> launcher
{% include 'launcher.py/base64' %}
EOF
chmod +x launcher
mv launcher ${out}/bin/
python3 ${out}/bin/launcher install ${out}/bin
rm -rf ${out}/jre/bin
ln -s ../bin ${out}/jre/bin
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export JAVA_HOME=${out}
export JAVA=${out}/bin/java
export JAVACMD=${out}/bin/java
{% endblock %}
