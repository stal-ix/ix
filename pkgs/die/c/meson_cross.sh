{% extends 'meson.sh' %}

{% block host_libs %}
lib/c
{% endblock %}

{% block step_setup %}
{{super()}}
cat << EOF > ${tmp}/native.ini
[binaries]
c = '${HOST_CC}'
cpp = '${HOST_CXX}'
EOF
{% endblock %}

{% block meson_cross %}
--native-file=${tmp}/native.ini
{{super()}}
{% endblock %}
