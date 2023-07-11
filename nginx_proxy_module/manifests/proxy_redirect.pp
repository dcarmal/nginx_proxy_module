# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include nginx_proxy_module::proxy_redirect
class nginx_proxy_module::proxy_redirect {
  # Look for origins and targets configured
  $proxy_origin = lookup('nginx_proxy_module::proxy_redirect::redirect_origin')
  $proxy_target = lookup('nginx_proxy_module::proxy_redirect::redirect_target')
  $proxy_origin.each |String $url| {
    notify { "Encontrada URL: ${url}":
      message => "Encontrada URL: ${url}",
    }
  }
  $proxy_target.each |String $target| {
    notify { "Encontrado objetivo: ${target}":
      message => "Encontrado objetivo: ${target}",
    }
  }
}
