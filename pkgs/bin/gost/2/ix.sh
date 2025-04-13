{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gost
{% endblock %}

{% block version %}
2.12.0
{% endblock %}

{% block go_url %}
https://github.com/ginuerzh/gost/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2307cf2ea61eccf2c90f1201d9fa68048915d27c15963802e8fd304fce6dcea8
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/gost
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gost ${out}/bin/
{% endblock %}
