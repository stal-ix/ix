{% extends '//bin/fusermount/2/ix.sh' %}

{% block patch %}
{{super()}}
patch -p1 <<'PATCH'
--- a/util/fusermount.c
+++ b/util/fusermount.c
@@ -1029,9 +1029,9 @@
 	int fd;
 	int err;
 
-	drop_privs();
+	/* The sud bridge authorizes opening a root-only /dev/fuse.
+	 * Mountpoint checks still use the caller's real UID below. */
 	fd = try_open(FUSE_DEV_NEW, devp, 0);
-	restore_privs();
 	if (fd >= 0)
 		return fd;
PATCH
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin ${out}/old-bin
mkdir -p ${out}/bin
mv ${out}/old-bin/fusermount ${out}/bin/fusermount-sud-backend
chmod 0755 ${out}/bin/fusermount-sud-backend
rm -rf ${out}/old-bin ${out}/share
{% endblock %}
