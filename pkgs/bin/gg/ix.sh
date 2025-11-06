{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/9b25bd18cc9528933fc9ba3ff483ad3ac3136f31.zip
{% endblock %}

{% block go_sha %}
9be20e9a8a58d2be8637e12efadf67557bbcefebb7198f98f841b95bf6c1589d
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block go_bins %}
gg
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/gg{{target.exe_suffix}} ${out}/bin/ya{{target.exe_suffix}}
{% endblock %}
