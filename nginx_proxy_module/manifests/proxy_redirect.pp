# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include nginx_proxy_module::proxy_redirect
class nginx_proxy_module::proxy_redirect {
  # Look for origins and targets configured
  $proxy_redirect = lookup('nginx_proxy_module::proxy_redirect::proxy_redirect')
  # $proxy_target = lookup('nginx_proxy_module::proxy_redirect::redirect_target')
  # $proxy_origin.each |String $url| {
  #   notify { "Encontrada URL: ${url}":
  #     message => "Encontrada URL: ${url}",
  #   }
  # }
  $proxy_redirect.each |$adress| {
    $origin = $adress[0]
    $target = $adress[1]
    notify { "Encontrado origen: ${origin} apuntando a destino ${target}":
      message => "Encontrado origen: ${origin} apuntando a destino ${target}",
    }
  }
}
