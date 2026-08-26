{% extends '//die/go/build.sh' %}

{% block pkg_name %}
circumflex
{% endblock %}

{% block version %}
5.0
{% endblock %}

{% block go_url %}
https://github.com/bensadeh/circumflex/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9210e25bfaafcc9801a14daf37711322b2388325909954dec21f683507dc97d8
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
bin/go/lang/26
{% endblock %}
