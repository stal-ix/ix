{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=java)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=zip)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=jvm)
lib/dl/plugin(dl_for=bld/java/boot/iced/libs,dl_lib=jsig)
{% endblock %}

{% block bld_tool %}
bld/java/boot/iced/exe
{{super()}}
{% endblock %}

{% block script_init_env %}
export PLUGINS=
{{super()}}
{% endblock %}
