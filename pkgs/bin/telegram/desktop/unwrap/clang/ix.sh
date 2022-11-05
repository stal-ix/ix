{% extends '//bin/telegram/desktop/unwrap/t/ix.sh' %}

{% block setup %}
{{super()}}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block patch1 %}
{{super()}}

base64 -d << EOF > Telegram/codegen/codegen/style/structure_types.cpp
{% include 'structure_types.cpp/base64' %}
EOF

base64 -d << EOF > Telegram/codegen/codegen/style/structure_types.h
{% include 'structure_types.h/base64' %}
EOF

base64 -d << EOF > Telegram/SourceFiles/passport/passport_panel_edit_scans.h
{% include 'passport_panel_edit_scans.h/base64' %}
EOF

base64 -d << EOF > Telegram/SourceFiles/passport/passport_panel_edit_scans.cpp
{% include 'passport_panel_edit_scans.cpp/base64' %}
EOF
{% endblock %}
