{% extends '//lib/mesa/t/mix.sh' %}

{% block meson_flags%}
{{super()}}
dri-drivers=

vulkan-drivers={% block vulkan %}{% endblock %}

gallium-drivers={% block gallium %}{% endblock %}
{% endblock %}

{% block c_rename_symbol %}
vk_device_dispatch_table_from_entrypoints
vk_device_dispatch_table_get
vk_device_dispatch_table_get_if_supported
vk_device_dispatch_table_load
vk_device_trampolines
vk_instance_dispatch_table_from_entrypoints
vk_instance_dispatch_table_get
vk_instance_dispatch_table_get_if_supported
vk_instance_dispatch_table_load
vk_physical_device_dispatch_table_from_entrypoints
vk_physical_device_dispatch_table_get
vk_physical_device_dispatch_table_get_if_supported
vk_physical_device_dispatch_table_load
vk_physical_device_trampolines

driCheckOption
driDestroyOptionCache
driDestroyOptionInfo
driGetOptionsXml
driInjectDataDir
driInjectExecName
driParseConfigFiles
driParseOptionInfo
driQueryOptionb
driQueryOptionf
driQueryOptioni
driQueryOptionstr

handle_table_remove

zwp_linux_buffer_params_v1_interface
zwp_linux_dmabuf_feedback_v1_interface
zwp_linux_dmabuf_v1_interface
{% endblock %}

{% block install %}
cd ${out}; mkdir lib; cd lib

find ${tmp} -name '*.a' -type f | while read l; do
    cp ${l} ./
done

find ${tmp} -name '*.so' -type f | while read l; do
    cp ${l} ./
done
{% endblock %}

{% block no_lib_env %}
{% endblock %}
