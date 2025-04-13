{% extends '//bin/meson/1/3/ix.sh' %}

{% block pkg_name %}
meson
{% endblock %}

{% block version %}
1.5.2
{% endblock %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:fb41882bef26ffc02647d9978cba502a4accdf2e94c0a6dc9cc498dd7463381e
{% endblock %}
