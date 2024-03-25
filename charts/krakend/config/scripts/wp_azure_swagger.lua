function swagger_auth_modal(r,jwt,scope,client_id)
    local body = r:body()
    body = body:gsub('href="./', 'href="/api/uniconfig-docs');
    body = body:gsub('href="index.css"', 'href="/api/uniconfig-docs/index.css"');
    r:headers('Content-Length', tostring(body:len()))
    return body
end