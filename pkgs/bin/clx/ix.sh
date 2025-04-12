{% extends '//die/go/build.sh' %}

{% block version %}
3.5
{% endblock %}

{% block go_url %}
https://github.com/bensadeh/circumflex/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2c8c5594176cf067025a538474255d7aba9b360022e5961fb100ae5534a0099c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp clx ${out}/bin/
{% endblock %}
