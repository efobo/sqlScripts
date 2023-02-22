do
$$
declare
table_count integer := 0;
columns_count integer := 0;
col_count integer := 0;
index_count integer := 0;
rows_count integer := 0;
table_record record;
res text;
begin
select count(*) INTO table_count
from information_schema.tables
where table_schema = 'public';
raise notice 'Количество таблиц в схеме isu_ucheb - %', table_count;

SELECT COUNT(COLUMN_NAME) INTO columns_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = 'ucheb' AND TABLE_SCHEMA = 'public';
raise notice 'Количество столбцов в схеме isu_ucheb - %', columns_count;

SELECT count(*) INTO index_count FROM pg_indexes;
raise notice 'Количество индексов в схеме isu_ucheb - %', index_count;
raise notice '';
raise notice 'Таблицы схемы isu_ucheb';
raise notice '   Имя                  Столбцов     Строк ';
raise notice '-----------------------------------------------';

for table_record in SELECT table_name
FROM information_schema.tables
WHERE table_schema='public'
  AND table_type='BASE TABLE'
loop
	
	
	SELECT COUNT(COLUMN_NAME) FROM information_schema.columns WHERE table_name=table_record.table_name INTO col_count;
	
	EXECUTE 'select count(*) from ' || table_record.table_name INTO rows_count;
	
	select format('%-30s %-7s %-7s', table_record.table_name, col_count, rows_count) into res;
	raise notice '%', res;
	
	
end loop;
raise notice '-----------------------------------------------';
end;
$$ LANGUAGE plpgsql;


