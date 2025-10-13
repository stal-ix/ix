{% extends '//die/go/build.sh' %}

{% block pkg_name %}
oras
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block go_url %}
https://github.com/oras-project/oras/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
94e29528d38c49a704c255b5fff747824f41b9276bf12ffc3de563a49ac4261f
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/oras
{% endblock %}

{% block go_bins %}
oras
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
