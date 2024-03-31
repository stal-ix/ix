{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.13.tar.gz
{% endblock %}

{% block go_sha %}
661f2ea8aa8ea0060b4a2471441f8c54d046b9c9351fe83f6590ce448ad3ab6d
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}
