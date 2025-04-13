{% extends '//die/c/configure.sh' %}

{% block version %}
6.2.32
{% endblock %}

{% block fetch %}
https://download.oracle.com/berkeley-db/db-{{self.version().strip()}}.tar.gz
sha:a9c5e2b004a5777aa03510cfe5cd766a4a3b777713406b02809c17c8e0e7a8fb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block step_unpack %}
{{super()}}
cd build_unix
{% endblock %}

{% block configure_script %}
../dist/configure
{% endblock %}

{% block configure_flags %}
--enable-compat185
--enable-static
--enable-dbm
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
