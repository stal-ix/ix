{% extends '//die/go/build.sh' %}

{% block pkg_name %}
circumflex
{% endblock %}

{% block version %}
5.1
{% endblock %}

{% block go_url %}
https://github.com/bensadeh/circumflex/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1957c7a16a4cfbace855093c75aba4e2a53a1078ad2f0b9fe809d0229dbbad86
{% endblock %}

{% block go_parent_id %}
clx_{{self.go_sha().strip()}}
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/clx
{% endblock %}

{% block go_bins %}
clx
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
