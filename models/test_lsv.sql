select 
*
from {{ source('lsv_dbt', 'bike') }}

limit 50