{% extends '//die/c/autorehell.sh' %}

# noauto

{% block pkg_name %}
curl
{% endblock %}

{% block version %}
8.14.0
{% endblock %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-{{self.version().strip().replace('.', '_')}}.tar.gz
sha:93fc06e62db6c0ae8841d967179e04cc4e8b1837fa38d4db3d570eadd82be112
{% endblock %}

{#
https://github.com/curl/curl/archive/refs/tags/curl-8_13_0.tar.gz
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
