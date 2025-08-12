{% extends '//die/go/build.sh' %}

{% block pkg_name %}
geesefs
{% endblock %}

{% block version %}
0.43.2
{% endblock %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c3a4a36f7ae7a5eec2e557aaab575414dfdd4514f9c97cdeccaad9238e0f67af
{% endblock %}

{% block go_bins %}
geesefs
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
