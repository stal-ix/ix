{% extends '//lib/unbound/t/ix.sh' %}

{% block bld_libs %}
lib/mnl
lib/bsd
lib/event
lib/hiredis
#lib/ng/http/2
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-libbsd
--with-pthreads
--without-dynlibmodule
--enable-static-exe
--enable-fully-static
{% endblock %}
