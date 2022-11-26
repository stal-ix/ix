{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.jedsoft.org/releases/most/most-5.2.0.tar.gz
sha:9455aeb8f826fa8385c850dc22bf0f22cf9069b3c3423fba4bf2c6f6226d9903
{% endblock %}

{% block bld_libs %}
lib/c
lib/slang
lib/shim/fake(lib_name=termcap)
{% endblock %}

{% block setup %}
export CPPFLAGS="-iquote ${PWD}/src ${CPPFLAGS}"
{% endblock %}
