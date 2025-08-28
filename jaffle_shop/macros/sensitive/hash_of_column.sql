{% macro hash_of_column(column) %}

    {% if target.type == 'postgres' %}
        digest(
            TRIM(
                LOWER(
                    CAST({{ column|lower }} AS {{ type_string() }})
                    || '{{ jaffle_shop.get_salt(column|lower) }}'
                )
            ),
            'sha256'
        ) AS {{column|lower}}_hash,
    {% else %}
        SHA2(
            TRIM(
                LOWER(
                    CAST({{ column|lower }} AS {{ type_string() }})
                    || '{{ jaffle_shop.get_salt(column|lower) }}'
                )
            ),
            256
        ) AS {{column|lower}}_hash,
    {% endif %}

{% endmacro %}
