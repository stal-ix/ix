{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/isacikgoz/tldr/archive/refs/tags/v1.0.0-alpha.tar.gz
sha:d40e1c602d84acc67cdee3b9bed001fb8ec198c7049c1d05eb071ab05af66c19
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/tldr
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp tldr ${out}/bin/
{% endblock %}
