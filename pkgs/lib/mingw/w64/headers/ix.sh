{% extends '//lib/mingw/w64/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd mingw-w64-headers
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-sdk=all
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/include/pthread_signal.h
rm ${out}/include/pthread_time.h
rm ${out}/include/pthread_unistd.h
{% endblock %}
