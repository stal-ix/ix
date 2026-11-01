{% extends '//bin/meson/1/3/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.5.2
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
fb41882bef26ffc02647d9978cba502a4accdf2e94c0a6dc9cc498dd7463381e
{% endblock %}

{% block step_patch %}
base64 -d << EOF | patch -p2
{% include '0.diff/base64' %}
EOF
{% endblock %}
