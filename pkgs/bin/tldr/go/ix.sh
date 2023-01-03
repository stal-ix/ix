{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/isacikgoz/tldr/archive/refs/tags/v1.0.0-alpha.tar.gz
{% endblock %}

{% block go_sum %}
sha:d40e1c602d84acc67cdee3b9bed001fb8ec198c7049c1d05eb071ab05af66c19
{% endblock %}

{% block go_sha %}
sha:012e5aa2a00f0ddd74a79ba52838ab9ae2555ec055d764b9939c49645cfdd0ee
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/tldr
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp tldr ${out}/bin/
{% endblock %}
