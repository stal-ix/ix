{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/env.d
cat << EOF > ${out}/etc/env.d/gsk_renderer.sh
export GSK_RENDERER=ngl
EOF
{% endblock %}
