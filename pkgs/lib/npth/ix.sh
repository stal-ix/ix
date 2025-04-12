{% extends '//die/c/autohell.sh' %}

{% block version %}
1.8
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/npth/npth-{{self.version().strip()}}.tar.bz2
sha:8bd24b4f23a3065d6e5b26e98aba9ce783ea4fd781069c1b35d149694e90ca3e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_cross %}
{% if linux %}
--target={{target.gnu.three}}-musl
--build={{host.gnu.three}}-musl
--host={{target.gnu.three}}-musl
{% else %}
{{super()}}
{% endif %}
{% endblock %}
