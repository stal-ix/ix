{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dive
{% endblock %}

{% block version %}
0.13.1
{% endblock %}

{% block go_url %}
https://github.com/wagoodman/dive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7b94068a6257567178e8d6cda717d485f5b5c51cebefd4831afa190780fe9aee
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o dive_bin
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dive_bin ${out}/bin/dive
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
