# @summary Class for NGINX redirects
#
# This class configures proxy redirections based on hiera data files.
# "lookups" for at least one of the following configuration blocks:
#
# nginx_proxy_module::proxy_redirect::redirects:
#   [proxy's name]:
#     - - [source petition]
#       - [target server]
#
# @example
#   include nginx_proxy_module::proxy_redirect
class nginx_proxy_module::proxy_redirect {
  include nginx
  $proxy_redirect = lookup('nginx_proxy_module::proxy_redirect::redirects')
  $proxy_redirect.each |$proxy_name, $proxy_data| {
    $origin = $proxy_data[0][0]
    $target = $proxy_data[0][1]
    nginx::resource::location { $proxy_name:
      location            => '/',
      server              => $proxy_name,
      proxy_redirect      => $target,
      location_cfg_append => {
        'proxy_pass' => $origin,
      },
      # proxy_read_timeout    => '60s',#                                    String   = $nginx::proxy_read_timeout,
      # proxy_connect_timeout => '10s',#                                    String   = $nginx::proxy_connect_timeout,
      # proxy_send_timeout    => '60s',#                                    String   = $nginx::proxy_send_timeout,
      # proxy_set_header      => ['Host $host', 'X-Real-IP $remote_addr'],# Array    = $nginx::proxy_set_header,
      # proxy_hide_header     => ['X-Powered-By'],#                         Array    = $nginx::proxy_hide_header,
      # proxy_pass_header     #                                             Array    = $nginx::proxy_pass_header,
      # proxy_ignore_header   #                                             Array    = $nginx::proxy_ignore_header,
      # fastcgi_params        #                                             String   = "${nginx::conf_dir}/fastcgi.conf",
      # uwsgi_params          #                                             String   = "${nginx::config::conf_dir}/uwsgi_params",
      # ssl                   #                                             Boolean  = false,
      # ssl_only              #                                             Boolean  = false,
      # rewrite_rules         #                                             Array    = [],
      # priority              #                                             Integer  = 500,
      # mp4                   #                                             Boolean  = false,
      # flv                   #                                             Boolean  = false,
      # add_header            #                                             Hash     = {},
    }
  }
}
