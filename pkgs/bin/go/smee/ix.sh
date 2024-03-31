{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v0.21.0.tar.gz
{% endblock %}

{% block go_sha %}
15d644947a704eddfc2bd6e3abcdf3b33fd8ff71b4b267d42f5f05bb8348a822
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosmee.bin ${out}/bin/gosmee
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}
