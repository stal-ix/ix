{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sing-box
{% endblock %}

{% block version %}
1.11.7
{% endblock %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
598cc3b579cbc8cdecfc961205fa93043264d6f7a87bbfac703aaed9a3386a1f
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sing-box ${out}/bin/
{% endblock %}


{% block go_tool %}
bin/go/lang/24
{% endblock %}
