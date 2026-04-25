{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/ogorod/archive/e18fb1264baf893845545bdbdf047960e578d134.tar.gz
{% endblock %}

{% block go_sha %}
37f1cef2d182e6abd32db85f11f40e4a7fadef11ca6feaee7d529f8fcc07d175
{% endblock %}

{% block go_bins %}
ogorod
{% endblock %}
