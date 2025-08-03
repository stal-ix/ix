{% extends '//die/go/build.sh' %}

{% block pkg_name %}
geesefs
{% endblock %}

{% block version %}
0.43.1
{% endblock %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0a679e742d69bade0eadc3e57efabacda81544bb9fcd4c1fd5ddfbddcd17b1a1
{% endblock %}

{% block go_bins %}
geesefs
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
