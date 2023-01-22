{% extends '//bin/dash/t/ix.sh' %}

{% block fetch %}
http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.3.tar.gz
sha:62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin; mv dash sh
{% endblock %}
