# @summary Module for managing NGINX proxy configurations
#
# This module provides the necessary classes to manage NGINX proxy configurations.
# Contains the following classes:
# - proxy_redirect: Sets configurable proxy redirects via hieradata.
# - forward_proxy: Sets a forward proxy to register all http requests to the internet
# -
#
# @example
#   include nginx_proxy_module
class nginx_proxy_module {
  include nginx_proxy_module::proxy_redirect
  include nginx_proxy_module::forward_proxy
}
