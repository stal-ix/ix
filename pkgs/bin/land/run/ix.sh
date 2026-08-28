{% extends '//die/go/build.sh' %}

{% block pkg_name %}
landrun
{% endblock %}

{% block version %}
0.1.17
{% endblock %}

{% block go_url %}
https://github.com/Zouuup/landrun/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4777dbbc9f622143a9c2bd9c5154c27e136190982eeb85aac6605ba6a51c473c
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/landrun
{% endblock %}

{% block go_bins %}
landrun
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
