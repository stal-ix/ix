{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
curl
{% endblock %}

{% block version %}
8.12.1
{% endblock %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-{{self.version().strip().replace('.', '_')}}.tar.gz
sha:6edc063d1ebaf9cf3b3b46e9fef2f3cd8932694989ecd43d005d6e828426d09f
{% endblock %}

{#
#https://github.com/curl/curl/archive/refs/tags/curl-8_13_0.tar.gz
#sha:ccc5ba45d9f5320c70ffb24e5411b66ba55ea1f333bf78be0963ed90a9328699
/ix/build/MDjqMeM8IRlmXue54dm0E6/src/Source/cmCurl.cxx:178:26: error: assigning to 'CURL_NETRC_OPTION' from incompatible type 'long'
  178 |       curl_netrc_level = CURL_NETRC_OPTIONAL;
#}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block configure_flags %}
{% if linux %}
--with-random="/dev/urandom"
{% endif %}
{% if darwin %}
--disable-ldap
{% endif %}
{% endblock %}
