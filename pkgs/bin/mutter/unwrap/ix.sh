{% extends '//bin/mutter/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
bin/mutter/dl
{% endblock %}

{% block patch %}
{{super()}}
base64 -d << EOF > src/backends/native/meta-launcher.c
{% include 'meta-launcher.c/base64' %}
EOF
{% endblock %}
