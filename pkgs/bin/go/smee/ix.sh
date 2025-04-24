{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gosmee
{% endblock %}

{% block version %}
0.24.0
{% endblock %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6067bf777172262e50efaeea6d02606dac75cf34eebd194eb5ad1e631e636af3
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosmee.bin ${out}/bin/gosmee
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
