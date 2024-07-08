{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/2.19.5.tar.gz
sha:8d4a3826787f9febbdc225172ad2d39d7d3960346c5721fe46cb27d480d7e1de
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
