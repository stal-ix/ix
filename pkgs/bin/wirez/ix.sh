{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/v-byte-cpu/wirez/archive/2628dbf16fd4ed7c3943476d313bd4266db2eff9.zip
{% endblock %}

{% block go_sha %}
9985187e54e0822da1f64b5b346a49393ba9a807f02846c9b8e32b050b7fa2a1
{% endblock %}

{% block go_compiler %}
bin/go/lang/19
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp wirez ${out}/bin/
{% endblock %}
