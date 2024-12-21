/*
 *  Copyright (C) 2006 Giuseppe Torelli - <colossus73@gmail.com>
 *  Copyright (C) 2016 Ingo Brückl
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 *  MA 02110-1301 USA.
 */

#include "config.h"

#ifdef HAVE_SOCKET

#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <gtk/gtk.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/un.h>
#include "socket.h"
#include "window.h"

socket_info_t socket_info;

/* (Unix domain) socket support; taken from Geany */

static gint socket_fd_close (gint fd)
{
	return close(fd);
}

static gint socket_fd_connect_unix (const gchar *path)
{
	gint sock;
	struct sockaddr_un addr;

	sock = socket(PF_UNIX, SOCK_STREAM, 0);
	if (sock < 0)
	{
		perror("fd_connect_unix(): socket");
		return -1;
	}

	memset(&addr, 0, sizeof(addr));
	addr.sun_family = AF_UNIX;
	strncpy(addr.sun_path, path, sizeof(addr.sun_path) - 1);

	if (connect(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0)
	{
		socket_fd_close(sock);
		return -1;
	}
	return sock;
}

static gint socket_fd_open_unix (const gchar *path)
{
	gint sock;
	struct sockaddr_un addr;
	gint val;

	sock = socket(PF_UNIX, SOCK_STREAM, 0);

	if (sock < 0)
	{
		perror("sock_open_unix(): socket");
		return -1;
	}

	val = 1;
	if (setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &val, sizeof(val)) < 0)
	{
		perror("setsockopt");
		socket_fd_close(sock);
		return -1;
	}

	memset(&addr, 0, sizeof(addr));
	addr.sun_family = AF_UNIX;
	strncpy(addr.sun_path, path, sizeof(addr.sun_path) - 1);

	if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0)
	{
		perror("bind");
		socket_fd_close(sock);
		return -1;
	}

	if (listen(sock, 1) < 0)
	{
		perror("listen");
		socket_fd_close(sock);
		return -1;
	}

	return sock;
}

static gint socket_fd_check_io (gint fd, GIOCondition cond)
{
	struct timeval timeout;
	fd_set fds;
	gint flags;
	timeout.tv_sec  = 60;
	timeout.tv_usec = 0;

	// checking for non-blocking mode
	flags = fcntl(fd, F_GETFL, 0);
	if (flags < 0)
	{
		perror("fcntl");
		return 0;
	}

	if ((flags & O_NONBLOCK) != 0)
		return 0;

	FD_ZERO(&fds);
	FD_SET(fd, &fds);

	if (cond == G_IO_IN)
	{
		select(fd + 1, &fds, NULL, NULL, &timeout);
	}
	else
	{
		select(fd + 1, NULL, &fds, NULL, &timeout);
	}

	if (FD_ISSET(fd, &fds))
	{
		return 0;
	}
	else
		return -1;
}

static gint socket_fd_write (gint fd, const gchar *buf, gint len)
{
	if (socket_fd_check_io(fd, G_IO_OUT) < 0)
		return -1;
	return write(fd, buf, len);
}

static gint socket_fd_write_all (gint fd, const gchar *buf, gint len)
{
	gint n, wrlen = 0;

	while (len)
	{
		n = socket_fd_write(fd, buf, len);
		if (n <= 0)
			return -1;
		len -= n;
		wrlen += n;
		buf += n;
	}

	return wrlen;
}

static gint socket_fd_recv (gint fd, gchar *buf, gint len, gint flags)
{
	if (socket_fd_check_io(fd, G_IO_IN) < 0)
		return -1;

	return recv(fd, buf, len, flags);
}

static gint socket_fd_read (gint fd, gchar *buf, gint len)
{
	if (socket_fd_check_io(fd, G_IO_IN) < 0)
		return -1;
	return read(fd, buf, len);
}

static gint socket_fd_gets (gint fd, gchar *buf, gint len)
{
	gchar *newline, *bp = buf;
	gint n;

	if (--len < 1)
		return -1;
	do
	{
		if ((n = socket_fd_recv(fd, bp, len, MSG_PEEK)) <= 0)
			return -1;
		if ((newline = memchr(bp, '\n', n)) != NULL)
			n = newline - bp + 1;
		if ((n = socket_fd_read(fd, bp, n)) < 0)
			return -1;
		bp += n;
		len -= n;
	} while (! newline && len);

	*bp = '\0';
	return bp - buf;
}

gint socket_init(gint argc, gchar **argv)
{
	GdkDisplay *display;
	gint sock;

	display = gdk_display_get_default();

	if (socket_info.file_name == NULL)
		socket_info.file_name = g_strconcat("/tmp/." PACKAGE "-socket", display ? gdk_display_get_name(display) : ":0", "-", g_get_user_name(), NULL);

	sock = socket_fd_connect_unix(socket_info.file_name);
	if (sock < 0)
	{
		unlink(socket_info.file_name);
		return socket_fd_open_unix(socket_info.file_name);
	}
	// remote command mode, here we have another running instance and want to use it
	if (argc > 1)
	{
		gint i;
		gchar *filename;

		socket_fd_write_all(sock, "open\n", 5);

		for(i = 1; i < argc && argv[i] != NULL; i++)
		{
			filename = argv[i];

			if (filename != NULL)
			{
				socket_fd_write_all(sock, filename, strlen(filename));
				socket_fd_write_all(sock, "\n", 1);
			}
		}
		socket_fd_write_all(sock, ".\n", 2);
	}
	socket_fd_close(sock);
	return -1;
}

gint socket_finalize(void)
{
	if (socket_info.lock_socket < 0) return -1;

	if (socket_info.lock_socket_tag > 0)
		g_source_remove(socket_info.lock_socket_tag);
	if (socket_info.read_ioc)
	{
		g_io_channel_shutdown(socket_info.read_ioc, FALSE, NULL);
		g_io_channel_unref(socket_info.read_ioc);
		socket_info.read_ioc = NULL;
	}

	unlink(socket_info.file_name);
	g_free(socket_info.file_name);
	return 0;
}

gboolean socket_lock_input_cb (GIOChannel *source, GIOCondition condition, gpointer window)
{
	gint fd, sock;
	gchar buf[4096];
	gchar *buf_to_free;
	struct sockaddr_in caddr;
	guint caddr_len;
	caddr_len = sizeof(caddr);

	fd = g_io_channel_unix_get_fd(source);
	sock = accept(fd, (struct sockaddr *)&caddr, &caddr_len);
	// first get the command
	if (socket_fd_gets(sock, buf, sizeof(buf)) != -1 && strncmp(buf, "open", 4) == 0)
	{
		while (socket_fd_gets(sock, buf, sizeof(buf)) != -1 && *buf != '.')
		{
			g_strstrip(buf); // remove \n char
			buf_to_free = g_strdup (buf);
			if (g_file_test(buf, G_FILE_TEST_IS_REGULAR | G_FILE_TEST_IS_SYMLINK))
				xa_open_archive (NULL,buf_to_free);
		}
		gtk_window_deiconify (GTK_WINDOW(window));
	}
	socket_fd_close(sock);
	return TRUE;
}

#endif
