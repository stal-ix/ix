{% extends '//lib/vulkan/loader/t/mix.sh' %}

{% block install %}
{{super()}}

cd ${out}; mkdir -p etc/vulkan/icd.d; cd etc/vulkan/icd.d

cat << EOF > radeon_icd.x86_64.json
{% include 'radeon_icd.x86_64.json' %}
EOF
{% endblock %}

{% block env %}
export VULKAN_LOADER_DATA="${out}"
{% endblock %}
