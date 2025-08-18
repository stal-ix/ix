#!/usr/bin/env python3

import sys

import http.server as hs


def get_secret(path, chost):
    if '..' in path:
        return b''

    with open('/home/pg/repos/secrets/' + str(chost) + '/' + path, 'rb') as f:
        return f.read()


class Handler(hs.BaseHTTPRequestHandler):
    def do_GET(self):
        chost, cport = self.client_address

        try:
            res, code = get_secret(self.path, chost), 200
        except Exception as e:
            self.send_error(404, message=str(e))
            return

        self.send_response(code)
        self.send_header("Content-type", "text/plain")
        self.end_headers()

        if res:
            self.wfile.write(res)


if __name__ == '__main__':
    hs.ThreadingHTTPServer(('192.168.100.64', 8022), Handler).serve_forever()
