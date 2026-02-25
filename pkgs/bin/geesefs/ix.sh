{% extends '//die/go/build.sh' %}

{% block pkg_name %}
geesefs
{% endblock %}

{% block version %}
0.43.3
{% endblock %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ec712bce60170e588374f2b5ef28be8d7ef706866ce67fe2574c42d231bb04d2
{% endblock %}

{% block go_bins %}
geesefs
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
