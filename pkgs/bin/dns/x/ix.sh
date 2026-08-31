{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsx
{% endblock %}

{% block version %}
1.3.1
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/dnsx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7c841dd15abb15fbfc0c9bd6e357de0c02bddad7db8a8da91617a5b3061db8ea
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dnsx
{% endblock %}

{% block go_bins %}
dnsx
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
