FROM openresty/openresty:xenial
ENV PATH "/usr/local/openresty/luajit/bin/$PATH"

# Test dependencies
# The specs are actually for src/statsd.lua, which relies on luasocket
# rather than openresty cosocket.
RUN luarocks install busted
RUN luarocks install luasocket

COPY . .
RUN luarocks make

