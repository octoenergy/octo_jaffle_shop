{% macro hash_of_column(column) %}

    SHA256(
        TRIM(
            LOWER(
                CAST({{ column|lower }} AS {{ dbt.type_string() }})
                || '{{ jaffle_shop.get_salt(column|lower) }}'
            )
        )
    ) AS {{column|lower}}_hash,

{% endmacro %}
