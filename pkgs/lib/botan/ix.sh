{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/2.19.3.tar.gz
sha:8f568bf74c2e476d92ac8a1cfc2ba8407ec038fe9458bd0a11e7da827a9b8199
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/boost
{% endblock %}

{% block bld_libs %}
{#
In file included from src/cli/tls_proxy.cpp:20:
In file included from /ix/store/gyi2L49Xk9fZgmuo-lib-boost/include/boost/asio.hpp:20:
In file included from /ix/store/gyi2L49Xk9fZgmuo-lib-boost/include/boost/asio/any_completion_executor.hpp:18:
/ix/store/gyi2L49Xk9fZgmuo-lib-boost/include/boost/asio/detail/config.hpp:1684:11: fatal error: 'linux/version.h' file not found
 1684 | # include <linux/version.h>
#}
lib/kernel
{% endblock %}

{% block configure %}
python3 ./configure.py \
{% if help %}
    --help
exit 1
{% else %}
    --prefix=${out} \
    --os={{target.os}} \
    --cpu={{target.gnu_arch}} \
    --disable-shared-library \
    --with-boost \
    --without-documentation
{% endif %}
{% endblock %}
