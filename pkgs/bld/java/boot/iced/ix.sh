{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/build/muldefs
bld/java/boot/iced/rt
lib/shim/fake/symbol(symbol_name=NET_Poll)
lib/shim/fake/symbol(symbol_name=NET_Timeout0)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=zip)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=jvm)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=java)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=jsig)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=verify)
{% endblock %}

{% block bld_tool %}
bld/java/boot/iced/exe
{{super()}}
{% endblock %}

{% block script_init_env %}
export PLUGINS=
{{super()}}
{% endblock %}

{% block c_rename_symbol %}
signal
sigset
sigaction
{% endblock %}

{% block make_target %}
stamps/icedtea-boot.stamp
{% endblock %}

{% block install %}
cp -R openjdk.build-boot/j2sdk-image/* ${out}/
cp -R openjdk.build-boot/hotspot/outputdir/linux_amd64_compiler2/product/gamma ${out}/bin/hotspot
{% endblock %}
