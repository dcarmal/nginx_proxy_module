# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include nginx_proxy_module::proxy_redirect
class nginx_proxy_module::proxy_redirect {
  $proxy_redirect = lookup('nginx_proxy_module::proxy_redirect::redirects')

  $proxy_redirect.each |$proxy_name, $proxy_data| {
    $origin = $proxy_data[0][0]
    $target = $proxy_data[0][1]
    notify { "Servidor ${proxy_name} - Encontrado origen: ${origin} apuntando a destino ${target}":
      message => "Servidor ${proxy_name} - Encontrado origen: ${origin} apuntando a destino ${target}",
    }
  }
}
