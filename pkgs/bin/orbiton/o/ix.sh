{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/xyproto/orbiton/archive/refs/tags/v2.68.0.tar.gz
{% endblock %}

{% block go_sha %}
461c917a481b2769aaedb653b16832d3d0901987a3cae3a8a2ead65360eda007
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block unpack %}
{{super()}}
cd v2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp orbiton ${out}/bin/o
{% endblock %}
