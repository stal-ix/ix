{% extends 'meson0.sh' %}

{% block step_setup %}
{{super()}}
{% if self.host_libs().strip() %}
cat << EOF > ${tmp}/native.ini
[binaries]
c = '${HOST_CC}'
cpp = '${HOST_CXX}'
EOF
{% endif %}
{% endblock %}

{% block meson_cross %}
{% if self.host_libs().strip() %}
--native-file=${tmp}/native.ini
{% endif %}
{{super()}}
{% endblock %}
