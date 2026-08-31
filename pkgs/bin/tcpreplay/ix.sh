{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
tcpreplay
{% endblock %}

{% block version %}
4.6.1
{% endblock %}

{% block fetch %}
https://github.com/appneta/tcpreplay/releases/download/v{{self.version().strip()}}/tcpreplay-{{self.version().strip()}}.tar.xz
14b96e3565d6e66e813000d0d510afeaecb871f2b533182c391c6ccf948c3e21
{% endblock %}

{% block bld_libs %}
lib/c
lib/pcap
lib/kernel
{% endblock %}

{% block patch %}
patch -p1 <<'EOF'
--- a/src/common/txring.h
+++ b/src/common/txring.h
@@ -41,8 +41,2 @@
-#if __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1
 #include <net/ethernet.h> /* the L2 protocols */
 #include <linux/if_packet.h>
-#else
-#include <asm/types.h>
-#include <linux/if_ether.h> /* The L2 protocols */
-#include <linux/if_packet.h>
-#endif
EOF
{% endblock %}

{% block configure_flags %}
--enable-pcapconfig=no
--enable-static-link=yes
{% endblock %}
