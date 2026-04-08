{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dive
{% endblock %}

{% block version %}
0.9.2
{% endblock %}

{% block go_url %}
https://github.com/wagoodman/dive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d80c961e5ee914a918e7fe5cbafef1b357af50589eaec27dce7abb97e984d261
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
