CREATE OR REPLACE FUNCTION x.pg_search_dmetaphone(text) RETURNS text LANGUAGE SQL IMMUTABLE STRICT AS $function$
  SELECT string_agg(w, ' ')
  FROM (SELECT dmetaphone(unnest(string_to_array(regexp_replace($1, E'\\s+', ' ', 'g'), ' '))) AS w) x
$function$;