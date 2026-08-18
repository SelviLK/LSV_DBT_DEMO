{% macro date_utils(x,y) %}

 {% if y == 1 %}
  CASE 
    WHEN TO_TIMESTAMP({{x}}) < current_date() THEN 'PAST DATE' ELSE 'FUTURE DATE' 
  END 
 {% elif y == 2 %}
   CASE 
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2) THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5)  THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8)  THEN 'SUMMER'
    ELSE 'AUTUMN'
   END  
 {% else %}
    null
 {% endif %}

{% endmacro %}
