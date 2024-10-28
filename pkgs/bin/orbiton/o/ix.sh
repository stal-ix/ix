{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/xyproto/orbiton/archive/refs/tags/v2.68.1.tar.gz
{% endblock %}

{% block go_sha %}
ffcc64c0002de9aad22b6356c9cb99b0b1bfea498273a32ce42474aa4c970736
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
