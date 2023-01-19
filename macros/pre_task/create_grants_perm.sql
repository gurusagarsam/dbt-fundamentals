{% macro grant_permission(privilege, obj_type, obj_name, role_name, with_grant_opt=False,dry_run=False) %}
    
    {% set grant_permission_query %}

grant all on table citibikes.citi_bikes_ext on role acnpoc;
    GRANT {{ privilege }} ON {{ obj_type }} {{ obj_name }} ON ROLE {{ role_name }} {% if with_grant_opt %} WITH GRANT OPTION {% endif %}

    {% endset %}
   
    {% if not dry_run %}
        {% do log('Dry run of grant permission :\n' ~ grant_permission_query, True) %}
    {% else %}          
        {% do run_query(grant_permission_query) %}        
    {% endif %}
{% endmacro %}