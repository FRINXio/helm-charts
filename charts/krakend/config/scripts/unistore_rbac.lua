local hex_to_char = function(x)
    return string.char(tonumber(x, 16))
end

local unescape = function(url)
    return url:gsub("%%(%x%x)", hex_to_char)
end

function getenv(key, fallback)
    value = os.getenv(key)
    if value == nil then
        return fallback
    end
    return value
end
function user_group_auth(request)

    -- set variables from request
    local method = request:method()
    local url = unescape(request:url())

    local headers_group = request:headers('X-Auth-User-Groups')
    local headers_role = request:headers('X-Auth-User-Roles')
    local headers_all = headers_group .. "," .. headers_role
    -- Unistore RBAC settings
    local permited_groups=getenv('UNISTORE_CONTROLLER_ADMIN_GROUP')
    local other_role=getenv("UNISTORE_OTHER_PERMITTED_ROLES",'')
    local bearer_role=getenv("UNISTORE_BEARER_ROLE",'')
    local service_role=getenv("UNISTORE_SERVICE_ROLE",'')
    local network_role=getenv("UNISTORE_NETWORK_ROLE",'')
    local bearer_node=getenv("UNISTORE_BEARER_NODE",'')
    local service_node=getenv("UNISTORE_SERVICE_NODE",'')
    local network_node=getenv("UNISTORE_NETWORK_NODE",'')
    
    local permited_all=''
    if string.match(url, "node=") then
        -- Add role to permited_group based on node parameter