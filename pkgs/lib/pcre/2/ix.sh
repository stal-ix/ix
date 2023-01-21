{% extends '//lib/pcre/2/posix/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
rm lib/libpcre2-posix.a lib/pkgconfig/libpcre2-posix.pc include/pcre2posix.h
{% endblock %}
