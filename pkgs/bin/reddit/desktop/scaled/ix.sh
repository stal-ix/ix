{% extends '//bin/reddit/desktop/ix.sh' %}

{% block patch %}
base64 -d << EOF > src/imgui/imgui_impl_sdl.cpp
{% include 'imgui_impl_sdl.cpp/base64' %}
EOF

base64 -d << EOF > src/utils.cpp
{% include 'utils.cpp/base64' %}
EOF

base64 -d << EOF > src/main.cpp
{% include 'main.cpp/base64' %}
EOF

{{super()}}
{% endblock %}
