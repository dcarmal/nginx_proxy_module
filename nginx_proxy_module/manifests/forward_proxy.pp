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
  include nginx
  nginx::resource::server { 'forward_proxy':
    listen_port         => 80,
    proxy               => 'http://$http_host$request_uri',
    proxy_set_header    => ['X-Real-IP $remote_addr'],
    access_log          => '/var/log/nginx/forward_proxy.access.log',
    error_log           => '/var/log/nginx/forward_proxy.error.log',
    location_cfg_append => {
      'proxy_pass' => 'http://$host$request_uri',
    },
  }
}
