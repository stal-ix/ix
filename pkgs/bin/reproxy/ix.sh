{% extends '//die/go/build.sh' %}

{% block pkg_name %}
reproxy
{% endblock %}

{% block version %}
1.7.5
{% endblock %}

{% block go_url %}
https://github.com/umputun/reproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
bf64d3cc63e581c958216f1b4e8211a38332b0cb7994d0ff7be9e2d8c42fd5c5
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block go_bins %}
app
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/app ${out}/bin/reproxy
{% endblock %}
