# @summary Class for NGINX forward proxy configuration
#
# This class configures a forward proxy to log HTTP requests
# going from the internal network to the Internet including:
# - request protocol
# - remote IP
# - time taken to serve the request
#
# @example
#   include nginx_proxy_module::forward_proxy
class nginx_proxy_module::forward_proxy {
}
